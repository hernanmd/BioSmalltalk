"
Arlequin Samples Collection

Instance Variables
	matrix:			<Object>
	sampleClass:		<Object>

matrix
	- xxxxx

sampleClass
	- xxxxx

"
Class {
	#name : #BioA31SampleCollection,
	#superclass : #BioSampleCollection,
	#instVars : [
		'matrix',
		'iniFile'
	],
	#category : #'BioArlequin-Sample'
}

{ #category : #'instance creation' }
BioA31SampleCollection class >> forDNA [
	" Answer a new instance of the receiver suited to store DNA samples "

	^ self new sampleClass: BioA31DNASample
]

{ #category : #'instance creation' }
BioA31SampleCollection class >> forFrequency [
	" Answer a new instance of the receiver suited to store frequencies "

	^ self new sampleClass: BioA31FrequencySample
]

{ #category : #'instance creation' }
BioA31SampleCollection class >> forMicrosat [
	" Answer a new instance of the receiver suited to store frequencies "

	^ self new sampleClass: BioA31MicrosatSample
]

{ #category : #'instance creation' }
BioA31SampleCollection class >> forRFLP [
	" Answer a new instance of the receiver suited to store RFLP "

	^ self new sampleClass: BioA31RFLPSample
]

{ #category : #'instance creation' }
BioA31SampleCollection class >> forStandard [
	" Answer a new instance of the receiver suited to store Standard data "

	^ self new sampleClass: BioA31StandardSample
]

{ #category : #converting }
BioA31SampleCollection >> asString [
	" Answer the String representation of the receiver." 	

	^ String streamContents: [ : stream |
		self writeSamplesOn: stream 
			delimiter: self iniFile newProfileSection locusSeparator value. ]
	
]

{ #category : #iterating }
BioA31SampleCollection >> do: aBlock [
	"Refer to the comment in Collection|do:."
	
	self samples do: aBlock
]

{ #category : #accessing }
BioA31SampleCollection >> identifiers: aCollection [
	" Add samples from aCollection of identifiers to the receiver "
	
	aCollection do: [ : id |
		self samples addLast: (self sampleClass new 
					setNameFormatStandard;
					identifier: id;
					yourself) ]
]

{ #category : #accessing }
BioA31SampleCollection >> iniFile [
	^ iniFile
]

{ #category : #accessing }
BioA31SampleCollection >> iniFile: anObject [
	iniFile := anObject
]

{ #category : #accessing }
BioA31SampleCollection >> sequences [
	" Answer a Collection of the receiver's sequence strings "

	^ self samples collect: [ : smp | smp sequenceString ]
]

{ #category : #accessing }
BioA31SampleCollection >> sequences: aCollection [
	" Complete samples from aCollection of letters in the receiver "
	
	aCollection 
		with: self samples 
		do: [ : seq : sample |
			sample sequence: seq ]
]

{ #category : #private }
BioA31SampleCollection >> writeOn: aWriteStream [ 
	self samples do: [ : each | each writeOn: aWriteStream ]
]

{ #category : #accessing }
BioA31SampleCollection >> writeSamplesOn: aStream delimiter: aCharacter [
	" Write the receiver's samples into aStream "

	aStream
		nextPut: ${;
		bioCr.
	self samples 
		do: [ :smp | smp writeOn: aStream delimiter: aCharacter ] 
		separatedBy: [ aStream bioCr ].
	aStream nextPut: $}
]
