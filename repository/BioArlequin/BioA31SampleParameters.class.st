"
BioA31SampleParameters is a matrix formatter for generating the output for an Arlequin 3.x formatted file.

Instance Variables:
	identifiers	<Collection>
	frequencies	<Collection>
	sequences	<Collection>
	prvIdentifiers	<(Dictionary of: Object)>
	samplesPrefix	<String>					Random number for prefixing sample names, which has to be unique between populations in Arlequin
"
Class {
	#name : #BioA31SampleParameters,
	#superclass : #BioMatrixFormatter,
	#instVars : [
		'identifiers',
		'frequencies',
		'sequences',
		'prvIdentifiers',
		'samplesPrefix',
		'groupBuilder'
	],
	#category : 'BioArlequin-Sample'
}

{ #category : #accessing }
BioA31SampleParameters class >> description [

	^ 'Arlequin Sample Parameters (Version >= 3.1)'
]

{ #category : #'instance creation' }
BioA31SampleParameters class >> on: aBioA31GroupBuilder [
	" Answer a new instance of the receiver using aBioA31GroupBuilder to retrieve haplotypes and group samples "

	^ self new initializeWith: aBioA31GroupBuilder
]

{ #category : #private }
BioA31SampleParameters >> buildSampleFrom: assoc [
	" Building samples uses currently the HaplotypeDefinition format "

	identifiers add: (self groupBuilder atSequence: assoc key).
	frequencies add: assoc value size.
"	sequences add: assoc key"
]

{ #category : #accessing }
BioA31SampleParameters >> buildSamples [
	" Private - Build the Arlequin samples from aDictionary "
	
	self groupSamples associationsDo: [ : assoc |
		self buildSampleFrom: assoc ]
]

{ #category : #accessing }
BioA31SampleParameters >> buildSamplesAt: group [
	" Private - Build the Arlequin samples from aDictionary "
	
	group associationsDo: [ : assoc |
		self buildSampleFrom: assoc ]
]

{ #category : #private }
BioA31SampleParameters >> countFrequenciesByGroup [

	^ true
]

{ #category : #accessing }
BioA31SampleParameters >> frequencies [
	^ frequencies
]

{ #category : #accessing }
BioA31SampleParameters >> frequencies: anObject [
	frequencies := anObject
]

{ #category : #accessing }
BioA31SampleParameters >> frequenciesSize [
	" Cantidad de Filas : sampleDataItems sum: #size "
	
	^ (self frequencies sum: #value) asString.	
]

{ #category : #accessing }
BioA31SampleParameters >> groupBuilder [
	^ groupBuilder
]

{ #category : #accessing }
BioA31SampleParameters >> groupBuilder: anObject [
	groupBuilder := anObject
]

{ #category : #accessing }
BioA31SampleParameters >> groupSamples [

	^ self groupBuilder groupSamples
]

{ #category : #private }
BioA31SampleParameters >> haplotypeSequenceAt: idString [
	" Answer a <String> "
	
	^ self groupBuilder atHaplotypeName: idString
]

{ #category : #private }
BioA31SampleParameters >> haplotypeSequences [

	^ self identifiers collect: [ : p | self haplotypeSequenceAt: p ]
]

{ #category : #accessing }
BioA31SampleParameters >> identifiers [
	^ identifiers
]

{ #category : #accessing }
BioA31SampleParameters >> identifiers: anObject [
	identifiers := anObject
]

{ #category : #'initialize-release' }
BioA31SampleParameters >> initializeWith: aBioA31GroupBuilder [

	frequencies := OrderedCollection new.
	sequences := OrderedCollection new.
	identifiers := OrderedCollection new.
	prvIdentifiers := Dictionary new.
	"self samplesPrefix: '_' , ((SmallInteger maxVal atRandom greaseString) first: 3)."
	groupBuilder := aBioA31GroupBuilder.


]

{ #category : #printing }
BioA31SampleParameters >> printOn: aStream [

	super printOn: aStream.
	aStream
		nextPutAll: self size asString 
		between: $( and: $)
]

{ #category : #accessing }
BioA31SampleParameters >> samplesPrefix [
	^ samplesPrefix
]

{ #category : #accessing }
BioA31SampleParameters >> samplesPrefix: anObject [
	samplesPrefix := anObject
]

{ #category : #accessing }
BioA31SampleParameters >> sequences [
	^ sequences
]

{ #category : #accessing }
BioA31SampleParameters >> sequences: anObject [
	sequences := anObject
]

{ #category : #accessing }
BioA31SampleParameters >> size [

	^ self identifiers size
]
