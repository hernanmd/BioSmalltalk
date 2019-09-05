"
Represents a generic container of biological samples.


"
Class {
	#name : #BioSampleCollection,
	#superclass : #BioObject,
	#instVars : [
		'samples',
		'sampleClass',
		'samplesCollectionClass'
	],
	#category : 'BioSupport-Core'
}

{ #category : #'instance creation' }
BioSampleCollection class >> new: nElements [
	" Create a sample collection large enough to hold nElements without growing "
	
	| inst |
	inst := self new.
	inst samples: (inst samplesCollectionClass new: nElements).
	^ inst

]

{ #category : #comparing }
BioSampleCollection >> = aBioSampleCollection [
	"Answer whether the receiver and anObject represent the same object."

	self == aBioSampleCollection
		ifTrue: [ ^ true ].
	self class = aBioSampleCollection class
		ifFalse: [ ^ false ].
	^ self samples = aBioSampleCollection samples
]

{ #category : #accessing }
BioSampleCollection >> addBioSample: aBioSample [
	" Add aBioSample to the receiver "

	self samples add: aBioSample
]

{ #category : #accessing }
BioSampleCollection >> addSample: aString [
	" Add a <BioSample> identified by aString to the receiver "

	self samples add: 
		(self sampleClass new 
			identifier: aString;
			yourself)
]

{ #category : #accessing }
BioSampleCollection >> anyOne [
    " Answer a representative sample of the receiver "
   
    ^ self samples anyOne.
]

{ #category : #iterating }
BioSampleCollection >> collect: aBlockClosure [ 

	^ self samples collect: aBlockClosure 
]

{ #category : #accessing }
BioSampleCollection >> defaultSampleClass [
	" Answer a <Class> which is the default for individual samples in the receiver "
	
	^ BioSample
]

{ #category : #defaults }
BioSampleCollection >> defaultSamplesCollectionClass [
	" Answer the default class responsible for storing samples in the receiver "

	^ OrderedCollection 
]

{ #category : #accessing }
BioSampleCollection >> findSample: aString [
	" Find a <BioSample> identified by aString in the receiver "

	^ self samples 
		detect: [ : sample | sample identifier = aString ]
]

{ #category : #accessing }
BioSampleCollection >> frequencies: aCollection [
	" Add samples from aCollection of identifiers to the receiver "
	
	aCollection 
		with: self samples 
		do: [ : freq : sample | sample frequency: freq ]
]

{ #category : #comparing }
BioSampleCollection >> hash [
	" Private - hash is implemented because #= is implemented "

	^ self samples hash
]

{ #category : #accessing }
BioSampleCollection >> identifiers [
	" Answer a <Collection> with receiver's samples "
	
	^ self samples collect: #identifier
]

{ #category : #accessing }
BioSampleCollection >> identifiers: aCollection [
	" Add samples from aCollection of identifiers to the receiver "
	
	aCollection do: [: id |
		self samples addLast: 
			(BioSample new 
					setNameFormatStandard;
					identifier: id) ]
]

{ #category : #testing }
BioSampleCollection >> isEmpty [
	"Answer whether the receiver contains any elements."

	^ self size = 0
]

{ #category : #accessing }
BioSampleCollection >> markersCount [
    " Answer how many markers contains the receiver's samples (assuming all containing the same count of markers ) "
   
    | rep |
    rep := self samples anyOne.
    ^ rep markers size
]

{ #category : #testing }
BioSampleCollection >> notEmpty [
	"Answer whether the receiver contains any elements."
	"use isNotEmpty for consistency with isEmpty"

	^ self isEmpty not
]

{ #category : #printing }
BioSampleCollection >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		nextPutAll: self size
		between: $[ and: $]
]

{ #category : #accessing }
BioSampleCollection >> sampleClass [
	" Answer a <Class> associated with the receiver's individual samples "

	^ sampleClass
		ifNil: [ sampleClass := self defaultSampleClass ]
]

{ #category : #accessing }
BioSampleCollection >> sampleClass: aClass [
	" Set the receiver's class of particular sample to be aClass "
	
	sampleClass := aClass
]

{ #category : #accessing }
BioSampleCollection >> samples [
	" Answer a <Collection> of <BioSample> "

	^ samples
		ifNil: [ samples := self samplesCollectionClass new ]
]

{ #category : #accessing }
BioSampleCollection >> samples: anObject [
	samples := anObject
]

{ #category : #accessing }
BioSampleCollection >> samplesCollectionClass [
	" Answer a <Class> responsible for storing the receiver's samples "
	
	^ samplesCollectionClass
		ifNil: [ samplesCollectionClass := self defaultSamplesCollectionClass ]
]

{ #category : #accessing }
BioSampleCollection >> samplesCollectionClass: anObject [
	^ samplesCollectionClass := anObject
]

{ #category : #accessing }
BioSampleCollection >> size [
	" Answer how many elements the receiver contains. "
	
	^ self samples size
]

{ #category : #accessing }
BioSampleCollection >> sorted: aBlockClosure [ 

	^ self samples sorted: aBlockClosure 
]
