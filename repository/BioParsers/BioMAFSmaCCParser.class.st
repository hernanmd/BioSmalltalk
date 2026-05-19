Class {
	#name : 'BioMAFSmaCCParser',
	#superclass : 'SmaCCParser',
	#instVars : [
		'columnNames',
		'currentLineString',
		'headerParsed'
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

{ #category : 'as yet unclassified' }
BioMAFSmaCCParser >> columnNames [ ^ columnNames
]

{ #category : 'as yet unclassified' }
BioMAFSmaCCParser >> columnNames: anArray [ columnNames := anArray
]

{ #category : 'as yet unclassified' }
BioMAFSmaCCParser >> on: aScanner [
	super on: aScanner.
	columnNames := nil
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
BioMAFSmaCCParser >> parseStream: aStream [
	| scanner parser |
	scanner := BioMAFScanner on: aStream.
	parser := BioMAFSmaCCParser on: scanner.
	^ parser parse
]

{ #category : 'as yet unclassified' }
BioMAFSmaCCParser >> setField: key value: value in: mut [
	BioMAFParser new setField: key value: value in: mut
]
