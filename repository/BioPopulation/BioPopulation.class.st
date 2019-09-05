"
regionName			<String>
samples				<Bag>
sequences			<Bag>
"
Class {
	#name : #BioPopulation,
	#superclass : #BioNamedObject,
	#instVars : [
		'samples',
		'sequences',
		'region'
	],
	#category : 'BioPopulation-Core'
}

{ #category : #accessing }
BioPopulation >> addBioSample: aBioSample [
	" Add aBioSample to the receiver's population "

	self samples addBioSample: aBioSample
]

{ #category : #accessing }
BioPopulation >> addSample: aString [
	" Add a Sample identified by aString to the receiver's population "

	self samples addSample: aString
]

{ #category : #accessing }
BioPopulation >> addSequence: aSequence [

	self sequences add: aSequence
]

{ #category : #accessing }
BioPopulation >> clear [
	" Remove all individuals in the receiver "
	
	self samples removeAll
]

{ #category : #accessing }
BioPopulation >> defaultPopulationSize [
	" Answer a <Number> representing the default population count "

	^ 100	
]

{ #category : #accessing }
BioPopulation >> occurrencesOf: aSequence [
	" Answer how many of ocurrences contains aSequence."

	^ self sequences occurrencesOf: aSequence
]

{ #category : #printing }
BioPopulation >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream space.
	self territory printOn: aStream.
	self samples printOn: aStream.
		
]

{ #category : #accessing }
BioPopulation >> samples [
	"Answer the value of samples"

	^ samples
		ifNil: [ samples := BioSampleCollection new: self defaultPopulationSize ]
]

{ #category : #accessing }
BioPopulation >> samples: anObject [
	"Set the value of samples"

	samples := anObject
]

{ #category : #accessing }
BioPopulation >> sequences [
	"Answer the value of sequences"

	^ sequences
		ifNil: [ sequences := OrderedCollection new: 300 ]
]

{ #category : #accessing }
BioPopulation >> sequences: anObject [
	"Set the value of sequences"

	sequences := anObject
]

{ #category : #accessing }
BioPopulation >> territory [
	"Answer the value of regionName"

	^ region
]

{ #category : #accessing }
BioPopulation >> territory: anObject [
	"Set the value of regionName"

	region := anObject
]
