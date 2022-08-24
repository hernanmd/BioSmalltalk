"
Writer for Admixed Genotype Sample (.geno or .gen) file. This is a file which contains one sample per row with the following codes:

Internal Representation and Key Implementation Points.

Instance Variables
	bimFilePath:		<String>		Path to PLINK Map (extended format)
	pedFilePath:		<String>		Path PLINK PED

Example

BioLAMPLDGenotypeFormatter new 
	bimFilePath: 'file.bim';
	pedFilePath: 'file.ped';
	export.

"
Class {
	#name : #BioLAMPLDGenotypeFormatter,
	#superclass : #BioCSVFormatter,
	#instVars : [
		'pedFilePath',
		'bimFilePath',
		'referenceAlleles',
		'columnsToSkip'
	],
	#category : #'BioLAMPLD-Core'
}

{ #category : #accessing }
BioLAMPLDGenotypeFormatter class >> description [
	" See superimplementor's comment "
	
	^ 'LAMP-LD Genotype Format Writer'
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter class >> formatExtension [
	"Answer a <String> corresponding for the receiver's file output format"

	^ 'geno'
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter class >> identifiers [
	"Answer a <Collection> of identifiers of the receiver"
	
	^ #('lampld')
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> bimFilePath [
	^ bimFilePath
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> bimFilePath: anObject [
	bimFilePath := anObject
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> columnsToSkip [
	^ columnsToSkip
		ifNil: [ columnsToSkip := 6 ]
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> columnsToSkip: anObject [
	columnsToSkip := anObject
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> delimiter [
	" Answer the <Character> used to delimit fields "
	
	^ self delimiterSourceCharacter
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> export [
	" Export default features "

	self writeSampleRows.
	self outputFileStream close.
	self bioLog: 'Exported genotype contents in file ' , self outputFilename.
]

{ #category : #initialize }
BioLAMPLDGenotypeFormatter >> initialize [
	" Private - See superimplementor's comment "

	super initialize.
	self delimiterSourceCharacter: Character tab
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> initializeReferenceAlleles [

	^ (self newParserFor: self bimFilePath) rowsCollect: [ : bimRow | bimRow at: 5 ] 
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> pedFilePath [
	^ pedFilePath
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> pedFilePath: anObject [
	pedFilePath := anObject
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> referenceAlleleAt: anInteger [ 

	^ self referenceAlleles at: anInteger	
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> referenceAlleles [
	^ referenceAlleles
		ifNil: [ referenceAlleles := self initializeReferenceAlleles ]
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> referenceAlleles: anObject [
	referenceAlleles := anObject
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> writeGenotypeCode: pedLine referenceAllele: refAllele [

	(pedLine allButFirst: self columnsToSkip) do: [ : spacedAlleles |
		self outputFileStream 
			nextPutAll: (refAllele asDNANucleotide asLAMPLDGenotypeCode: (BioGenotype withSpacedAlleles: spacedAlleles)) asString ].
	self outputFileStream nextPutTerminator.
]

{ #category : #accessing }
BioLAMPLDGenotypeFormatter >> writeSampleRows [
	" Private - Write the Admixed Genotype Sample rows "

	| index |
	
	index := 1.
	(self newParserFor: self pedFilePath) rowsDo: [: pedLine |
			self 
				writeGenotypeCode: pedLine 
				referenceAllele: (self referenceAlleleAt: index).
			index := index + 1 ].

]
