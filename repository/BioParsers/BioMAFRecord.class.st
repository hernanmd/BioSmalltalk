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

{ #category : 'as yet unclassified' }
BioMAFRecord >> asDictionary [
	| dict |
	dict := Dictionary new.
	1 to: (columnNames size min: fields size) do: [ :i |
		dict at: (columnNames at: i) put: (fields at: i ifAbsent: [ '']) ].
	^ dict

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> atField: fieldName [ | idx | idx := columnNames indexOf: fieldName ifAbsent: [ ^ nil ]. idx > fields size ifTrue: [ ^ nil ]. ^ fields at: idx
]

{ #category : 'as yet unclassified' }
BioMAFRecord >> atField: fieldName put: aValue [
	| idx |
	idx := columnNames indexOf: fieldName ifAbsent: [ ^ self ].
	idx > fields size ifTrue: [ | newFields | newFields := Array new: idx withAll: '' replaceFrom: 1 to: fields size with: fields startingAt: 1. fields := newFields ].
	fields at: idx put: aValue

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> chromosome [
	^ self atField: 'Chromosome'

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> columnNames [
	^ columnNames

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> columnNames: anArray [
	columnNames := anArray

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> endPosition [
	| val |
	val := self atField: 'End_Position'.
	^ val ifNotNil: [ val asNumber ] ifNil: [ nil ]

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> entrezGeneId [
	| val |
	val := self atField: 'Entrez_Gene_Id'.
	^ val ifNotNil: [ val asNumber ] ifNil: [ nil ]

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> fields [
	^ fields

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> fields: anArray [
	fields := anArray

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> hugoSymbol [
	^ self atField: 'Hugo_Symbol'

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> initialize [
	super initialize.
	fields := Array new.
	columnNames := Array new
]

{ #category : 'as yet unclassified' }
BioMAFRecord >> referenceAllele [
	^ self atField: 'Reference_Allele'

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> startPosition [
	| val |
	val := self atField: 'Start_Position'.
	^ val ifNotNil: [ val asNumber ] ifNil: [ nil ]

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> tumorSampleBarcode [
	^ self atField: 'Tumor_Sample_Barcode'

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> tumorSeqAllele1 [
	^ self atField: 'Tumor_Seq_Allele1'

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> tumorSeqAllele2 [
	^ self atField: 'Tumor_Seq_Allele2'

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> variantClassification [
	^ self atField: 'Variant_Classification'

]

{ #category : 'as yet unclassified' }
BioMAFRecord >> variantType [
	^ self atField: 'Variant_Type'

]
