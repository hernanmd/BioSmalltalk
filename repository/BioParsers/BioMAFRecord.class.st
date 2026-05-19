"
A raw MAF record representing a single data line with column-name access. Stores parsed fields as a Dictionary keyed by column header names.

BioMAFRecord provides low-level column-access API (atField:, atField:ifAbsent:) while BioMutation provides rich domain accessors (hugoSymbol, chromosome, variantType, predicates like isSNP, isMissense, etc.). For most use cases, BioMutation is preferred.

Instance Variables:
  fields      <Dictionary String -> String>  Raw field values keyed by column name
  columnNames <Array of String>              Column header names in order

See also: BioMAFParser, BioMutation
"
Class {
	#name : 'BioMAFRecord',
	#superclass : 'Object',
	#instVars : [
		'fields',
		'columnNames'
	],
	#category : 'BioParsers-MAF',
	#package : 'BioParsers',
	#tag : 'MAF'
}

{ #category : 'converting' }
BioMAFRecord >> asDictionary [
	| dict |
	dict := Dictionary new.
	1 to: (columnNames size min: fields size) do: [ :i |
		dict at: (columnNames at: i) put: (fields at: i ifAbsent: [ '']) ].
	^ dict

]

{ #category : 'accessing' }
BioMAFRecord >> atField: fieldName [ | idx | idx := columnNames indexOf: fieldName ifAbsent: [ ^ nil ]. idx > fields size ifTrue: [ ^ nil ]. ^ fields at: idx
]

{ #category : 'accessing' }
BioMAFRecord >> atField: fieldName put: aValue [
	| idx |
	idx := columnNames indexOf: fieldName ifAbsent: [ ^ self ].
	idx > fields size ifTrue: [ | newFields | newFields := Array new: idx withAll: '' replaceFrom: 1 to: fields size with: fields startingAt: 1. fields := newFields ].
	fields at: idx put: aValue

]

{ #category : 'accessing' }
BioMAFRecord >> chromosome [
	^ self atField: 'Chromosome'

]

{ #category : 'accessing' }
BioMAFRecord >> columnNames [
	^ columnNames

]

{ #category : 'accessing' }
BioMAFRecord >> columnNames: anArray [
	columnNames := anArray

]

{ #category : 'accessing' }
BioMAFRecord >> endPosition [
	| val |
	val := self atField: 'End_Position'.
	^ val ifNotNil: [ val asNumber ] ifNil: [ nil ]

]

{ #category : 'accessing' }
BioMAFRecord >> entrezGeneId [
	| val |
	val := self atField: 'Entrez_Gene_Id'.
	^ val ifNotNil: [ val asNumber ] ifNil: [ nil ]

]

{ #category : 'accessing' }
BioMAFRecord >> fields [
	^ fields

]

{ #category : 'accessing' }
BioMAFRecord >> fields: anArray [
	fields := anArray

]

{ #category : 'private' }
BioMAFRecord >> hugoSymbol [
	^ self atField: 'Hugo_Symbol'

]

{ #category : 'initialization' }
BioMAFRecord >> initialize [
	super initialize.
	fields := Array new.
	columnNames := Array new
]

{ #category : 'accessing' }
BioMAFRecord >> referenceAllele [
	^ self atField: 'Reference_Allele'

]

{ #category : 'accessing' }
BioMAFRecord >> startPosition [
	| val |
	val := self atField: 'Start_Position'.
	^ val ifNotNil: [ val asNumber ] ifNil: [ nil ]

]

{ #category : 'private' }
BioMAFRecord >> tumorSampleBarcode [
	^ self atField: 'Tumor_Sample_Barcode'

]

{ #category : 'accessing' }
BioMAFRecord >> tumorSeqAllele1 [
	^ self atField: 'Tumor_Seq_Allele1'

]

{ #category : 'accessing' }
BioMAFRecord >> tumorSeqAllele2 [
	^ self atField: 'Tumor_Seq_Allele2'

]

{ #category : 'accessing' }
BioMAFRecord >> variantClassification [
	^ self atField: 'Variant_Classification'

]

{ #category : 'accessing' }
BioMAFRecord >> variantType [
	^ self atField: 'Variant_Type'

]
