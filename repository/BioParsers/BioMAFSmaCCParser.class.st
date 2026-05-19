"
A SmaCC-based parser for Mutation Annotation Format (MAF) files. Extends SmaCCParser for class hierarchy consistency with other BioSmalltalk parsers (BioGFF3File, VCF, BioBEDParser).

Like the GFF3 parser, this uses a hybrid approach: it inherits from SmaCCParser but reads lines directly from the scanner stream rather than using a formal SmaCC grammar. This is appropriate because MAF is a simple tab-delimited format with no recursive structure.

Both BioMAFParser (line-by-line) and BioMAFSmaCCParser produce identical BioMutationSet results. Use BioMAFParser for production (slightly faster) or BioMAFSmaCCParser for consistency with the SmaCC parser pattern.

API:
  BioMAFSmaCCParser parseFile: '/path/to/mutations.maf'
  BioMAFSmaCCParser parseString: mafText
  BioMAFSmaCCParser parseStream: aReadStream
  BioMutationSet fromSmaCCFile: '/path/to/mutations.maf'

Instance Variables:
  columnNames <Array of String>  Header column names from the MAF file

See also: BioMAFParser, BioMAFScanner, BioMutationSet
"
Class {
	#name : 'BioMAFSmaCCParser',
	#superclass : 'SmaCCParser',
	#instVars : [
		'columnNames'
	],
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'parsing' }
BioMAFSmaCCParser class >> parseFile: aFilePath [
	| stream result |
	stream := aFilePath asFileReference readStream.
	[ result := self parseStream: stream ] ensure: [ stream close ].
	^ result

]

{ #category : 'parsing' }
BioMAFSmaCCParser class >> parseStream: aStream [
	| parser mutationSet line lineNum columnNames |
	parser := BioMAFSmaCCParser new.
	mutationSet := BioMutationSet new.
	lineNum := 0.
	columnNames := nil.
	[ aStream atEnd ] whileFalse: [
		line := aStream nextLine.
		lineNum := lineNum + 1.
		line isEmpty ifFalse: [
			(line beginsWith: '#') ifFalse: [
				columnNames isNil
					ifTrue: [
						columnNames := (line findTokens: (Array with: Character tab)) collect: [ :s | s trimBoth ].
						mutationSet customColumns: columnNames.
						parser columnNames: columnNames ]
					ifFalse: [
						| mut |
						mut := parser parseDataLine: line lineNum: lineNum.
						mut ifNotNil: [ mutationSet addMutation: mut ] ] ] ] ].
	^ mutationSet
]

{ #category : 'parsing' }
BioMAFSmaCCParser class >> parseString: aString [
	^ self parseStream: aString readStream

]

{ #category : 'as yet unclassified' }
BioMAFSmaCCParser class >> scannerClass [ ^ BioMAFScanner
]

{ #category : 'accessing' }
BioMAFSmaCCParser >> columnNames [ ^ columnNames
]

{ #category : 'accessing' }
BioMAFSmaCCParser >> columnNames: anArray [ columnNames := anArray
]

{ #category : 'instance creation' }
BioMAFSmaCCParser >> on: aScanner [
	super on: aScanner.
	columnNames := nil
]

{ #category : 'accessing' }
BioMAFSmaCCParser >> parse [
	| mutationSet line lineNum rs |
	mutationSet := BioMutationSet new.
	lineNum := 0.
	columnNames := nil.
	rs := scanner stream.
	[ rs atEnd ] whileFalse: [
		line := rs nextLine.
		line ifNil: [ rs next. line := rs upToEnd ].
		lineNum := lineNum + 1.
		line isEmpty ifFalse: [
			(line beginsWith: '#')
				ifFalse: [
					columnNames isNil
						ifTrue: [
							columnNames := (line findTokens: (Array with: Character tab)) collect: [ :s | s trimBoth ].
							mutationSet customColumns: columnNames ]
						ifTrue: [
							| mut |
							mut := self parseDataLine: line lineNum: lineNum.
							mut ifNotNil: [ mutationSet addMutation: mut ] ] ] ] ].
	^ mutationSet
]

{ #category : 'parsing' }
BioMAFSmaCCParser >> parseDataLine: aLine lineNum: lineNum [
	| fields mut |
	fields := (aLine findTokens: (Array with: Character tab)) collect: [ :s | s trimBoth ].
	fields isEmpty ifTrue: [ ^ nil ].
	(fields size = 1 and: [ fields first isEmpty ]) ifTrue: [ ^ nil ].
	mut := BioMutation new.
	1 to: (columnNames size min: fields size) do: [ :i |
		self setField: (columnNames at: i) value: (fields at: i) in: mut ].
	^ mut
]

{ #category : 'parsing' }
BioMAFSmaCCParser >> parseStream: aStream [
	| scanner parser |
	scanner := BioMAFScanner on: aStream.
	parser := BioMAFSmaCCParser on: scanner.
	^ parser parse
]

{ #category : 'initialization' }
BioMAFSmaCCParser >> setField: key value: value in: mut [
	BioMAFParser new setField: key value: value in: mut
]
