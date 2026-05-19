"
A line-by-line parser for Mutation Annotation Format (MAF) files. Parses MAF v1.6+ format as used by TCGA and GDC, producing BioMutationSet objects containing BioMutation instances.

Supports all standard MAF columns (Hugo_Symbol, Chromosome, Start_Position, End_Position, Strand, Variant_Classification, Variant_Type, Reference_Allele, Tumor_Seq_Allele1/2, Tumor_Sample_Barcode, etc.) plus custom columns which are stored in each BioMutation customFields dictionary.

Comment lines (starting with #) and header lines are handled automatically. The first non-comment line is treated as column headers.

## API

```
  BioMAFParser parseFile: '/path/to/mutations.maf'
  BioMAFParser parseString: mafText
  BioMAFParser parseStream: aReadStream
  BioMutationSet fromMAFFile: '/path/to/mutations.maf'
```

## Instance Variables
  lineNumber <Integer>  Current line number for error reporting

See also: BioMAFSmaCCParser, BioMutation, BioMutationSet
"
Class {
	#name : 'BioMAFParser',
	#superclass : 'Object',
	#instVars : [
		'lineNumber'
	],
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'parsing' }
BioMAFParser class >> parseFile: aFilePath [
	^ BioMAFParser new parseFile: aFilePath

]

{ #category : 'parsing' }
BioMAFParser class >> parseStream: aStream [
	^ BioMAFParser new parseStream: aStream

]

{ #category : 'parsing' }
BioMAFParser class >> parseString: aString [
	^ BioMAFParser new parseString: aString

]

{ #category : 'initialization' }
BioMAFParser >> initialize [
	super initialize.
	lineNumber := 0

]

{ #category : 'parsing' }
BioMAFParser >> parseFile: aFilePath [

	| stream result |
	stream := aFilePath asFileReference readStream.
	result := [ self parseStream: stream ] ensure: [ stream close ].
	^ result
]

{ #category : 'parsing' }
BioMAFParser >> parseHeader: aLine into: aMutationSet [

	| cols |
	cols := (aLine findTokens: (Array with: Character tab)) collect: [ :s | s trimBoth ].
	aMutationSet customColumns: cols.
	^ cols
]

{ #category : 'parsing' }
BioMAFParser >> parseLine: aLine columnNames: columnNames [
	| fields mut |
	fields := (aLine findTokens: (Array with: Character tab)) collect: [ :s | s trimBoth ].
	fields isEmpty 
		ifTrue: [ ^ nil ].
	(fields size = 1 and: [ fields first isEmpty ]) 
		ifTrue: [ ^ nil ].
	mut := BioMutation new.
	1 to: (columnNames size min: fields size) do: [ :i |
		self setField: (columnNames at: i) value: (fields at: i) in: mut ].
	^ mut
]

{ #category : 'parsing' }
BioMAFParser >> parseStream: aStream [
	| mutationSet line |
	mutationSet := BioMutationSet new.
	lineNumber := 0.
	[ aStream atEnd ] whileFalse: [
		line := aStream nextLine.
		lineNumber := lineNumber + 1.
		line isEmpty ifFalse: [
			(line beginsWith: '#')
				ifFalse: [
					lineNumber = 1
						ifTrue: [ self parseHeader: line into: mutationSet ]
						ifFalse: [ | mut |
							mut := self parseLine: line columnNames: mutationSet customColumns.
							mut ifNotNil: [ mutationSet addMutation: mut ] ] ] ] ].
	^ mutationSet
]

{ #category : 'parsing' }
BioMAFParser >> parseString: aString [
	| stream |
	stream := aString readStream.
	^ self parseStream: stream

]

{ #category : 'initialization' }
BioMAFParser >> setField: key value: value in: mut [
	| trimmed |
	trimmed := value trimBoth.
	trimmed isEmpty ifTrue: [ ^ self ].
	key = 'Hugo_Symbol' ifTrue: [
			mut hugoSymbol: trimmed.
			^ self ].
	key = 'Entrez_Gene_Id' ifTrue: [
			[ mut entrezGeneId: trimmed asNumber ]
				on: Error
				do: [ self error ].
			^ self ].
	key = 'Chromosome' ifTrue: [
			mut chromosome: trimmed.
			^ self ].
	key = 'Start_Position' ifTrue: [
			[ mut startPosition: trimmed asNumber ]
				on: Error
				do: [ self error ].
			^ self ].
	key = 'End_Position' ifTrue: [
			[ mut endPosition: trimmed asNumber ]
				on: Error
				do: [ self error ].
			^ self ].
	key = 'Strand' ifTrue: [
			mut strand: trimmed.
			^ self ].
	key = 'Variant_Classification' ifTrue: [
			mut variantClassification: trimmed.
			^ self ].
	key = 'Variant_Type' ifTrue: [
			mut variantType: trimmed.
			^ self ].
	key = 'Reference_Allele' ifTrue: [
			mut referenceAllele: trimmed.
			^ self ].
	key = 'Tumor_Seq_Allele1' ifTrue: [
			mut tumorSeqAllele1: trimmed.
			^ self ].
	key = 'Tumor_Seq_Allele2' ifTrue: [
			mut tumorSeqAllele2: trimmed.
			^ self ].
	key = 'Tumor_Sample_Barcode' ifTrue: [
			mut tumorSampleBarcode: trimmed.
			^ self ].
	key = 'Matched_Norm_Sample_Barcode' ifTrue: [
			mut matchedNormSampleBarcode: trimmed.
			^ self ].
	key = 'Tumor_Allele_Freq' ifTrue: [
			[ mut tumorAlleleFreq: trimmed asNumber ]
				on: Error
				do: [ self error ].
			^ self ].
	key = 'Amino_Acid_Change' ifTrue: [
			mut aminoAcidChange: trimmed.
			^ self ].
	key = 'cDNA_Change' ifTrue: [
			mut cdnaChange: trimmed.
			^ self ].
	key = 'Protein_Position' ifTrue: [
			mut proteinPosition: trimmed.
			^ self ].
	key = 'Gene' ifTrue: [
			mut gene: trimmed.
			^ self ].
	key = 'Transcript_ID' ifTrue: [
			mut transcript: trimmed.
			^ self ].
	key = 'Verification_Status' ifTrue: [
			mut verificationStatus: trimmed.
			^ self ].
	key = 'Validation_Status' ifTrue: [
			mut verificationStatus: trimmed.
			^ self ].
	key = 'Filter' ifTrue: [
			mut filter: trimmed.
			^ self ].
	key = 'Mutation_Status' ifTrue: [
			mut mutationType: trimmed.
			^ self ].
	key = 'Total_Depth' ifTrue: [
			[ mut totalDepth: trimmed asNumber ]
				on: Error
				do: [ self error ].
			^ self ].
	mut customFieldAt: key put: trimmed
]
