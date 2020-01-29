"
Represents an unique biological (in contrast to chemical) sample within a population.

    Instance Variables
	formatters:		<Object>
	frequency:		<Object>
	identifier:			<Object>
	markers:			<Object>
	sequence:			<Object>


    Implementation Points
"
Class {
	#name : #BioSample,
	#superclass : #BioMaterial,
	#instVars : [
		'identifier',
		'descriptions',
		'sequence',
		'frequency',
		'formatters',
		'markers'
	],
	#category : #'BioSupport-Core'
}

{ #category : #comparing }
BioSample >> = aSample [
	"Answer whether the receiver and anObject represent the same object."

	self == aSample
		ifTrue: [ ^ true ].
	self class = aSample class
		ifFalse: [ ^ false ].
	^ self sequence = aSample sequence and: [ self identifier = aSample identifier ]
]

{ #category : #accessing }
BioSample >> addGenotypes: aCollection [
	" Add aCollection of genotypes to the receiver "
	
	self markers addAll: aCollection.

]

{ #category : #accessing }
BioSample >> addTo: aPopulation withId: instanceNumber [

	| builtId |

	builtId := String streamContents: [ : stream |
		stream 
			nextPutAll: aPopulation territory;
			space;
			nextPutAll: instanceNumber asString ].
	self identifier: builtId.		
	aPopulation addSample: self.
	^ self
]

{ #category : #accessing }
BioSample >> currentNamingStrategy [
	"Answer the value of currentNamingStrategy"

	^ self defaultNamingStrategy
]

{ #category : #accessing }
BioSample >> defaultNamingStrategy [

	^ BioStandardNaming 
]

{ #category : #accessing }
BioSample >> descriptions [
	^ descriptions
]

{ #category : #accessing }
BioSample >> descriptions: anObject [
	descriptions := anObject
]

{ #category : #accessing }
BioSample >> formatters [

	^ formatters
		ifNil: [ formatters := OrderedCollection new ]
]

{ #category : #accessing }
BioSample >> formatters: anObject [
	formatters := anObject
]

{ #category : #accessing }
BioSample >> frequency [
	"Answer the value of frequency"

	^ frequency
		ifNil: [ frequency := 0 ]
]

{ #category : #accessing }
BioSample >> frequency: anObject [
	"Set the value of frequency"

	frequency := anObject
]

{ #category : #comparing }
BioSample >> hash [
	" Private - hash is implemented because #= is implemented "

	^ self sequence hash bitXor: self identifier hash
]

{ #category : #accessing }
BioSample >> identifier [
	"Answer the value of identifier"

	^ identifier
]

{ #category : #accessing }
BioSample >> identifier: aString [
	"Set the value of identifier"

	identifier := self nameFormatter format: aString
]

{ #category : #initialize }
BioSample >> initialize [

	super initialize.
	self formatters add: BioStandardNaming new.
]

{ #category : #accessing }
BioSample >> markers [
	" Answer a <Collection> of receiver's markers (possibly of <BioGenotypeCollection>) "
	
	^ markers
		ifNil: [ markers := OrderedCollection new ]
]

{ #category : #accessing }
BioSample >> markers: anObject [
	markers := anObject
]

{ #category : #accessing }
BioSample >> markersLocus [
	" Answer a <Collection> with the receivers markers locus "
	
	^ self markers collect: #locus
]

{ #category : #accessing }
BioSample >> nameFormatter [

	^ self formatters detect: [: f | f isNamingFormat ]
]

{ #category : #printing }
BioSample >> printOn: aStream [

	super printOn: aStream.
	aStream 
		space;
		nextPut: $[;
		nextPutAll: self identifier asString;
		nextPut: $];
		space;
		nextPut: $(;
		nextPutAll: self frequency asString;
		nextPut: $)
]

{ #category : #accessing }
BioSample >> sequence [
	"Answer the value of sequence"

	^ sequence
]

{ #category : #accessing }
BioSample >> sequence: anObject [
	"Set the value of sequence"

	sequence := anObject
]

{ #category : #accessing }
BioSample >> setNameFormatStandard [
	" Use a standard null formatter "
	
	self formatters remove: self nameFormatter.
	self formatters add: BioStandardNaming new.
]
