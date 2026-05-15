"
Represents a reduced alphabet that maps protein sequences to fewer characters based on clustering criteria. Instance Variables: mapping name size source metadata
"
Class {
	#name : 'BioReducedAlphabet',
	#superclass : 'BioObject',
	#instVars : [
		'mapping',
		'name',
		'size',
		'source',
		'metadata'
	],
	#category : 'BioTools-Alphabets',
	#package : 'BioTools',
	#tag : 'Alphabets'
}

{ #category : 'instance creation' }
BioReducedAlphabet class >> fromMapping: aDictionary name: nameString size: sizeInteger source: sourceString [

	^ self new
		  initializeWithMapping: aDictionary
		  name: nameString asString
		  size: sizeInteger
		  source: sourceString asString
]

{ #category : 'initialization' }
BioReducedAlphabet >> initializeWithMapping: aDictionary name: nameString size: sizeInteger source: sourceString [

	mapping := aDictionary.
	name := nameString.
	size := sizeInteger.
	source := sourceString.
	metadata := Dictionary new
]

{ #category : 'accessing' }
BioReducedAlphabet >> mapping [

	^ mapping
]

{ #category : 'accessing' }
BioReducedAlphabet >> metadata [

	^ metadata ifNil: [ metadata := Dictionary new ]
]

{ #category : 'accessing' }
BioReducedAlphabet >> name [

	^ name
]

{ #category : 'enumerating' }
BioReducedAlphabet >> reduce: aString [

	| stream |
	stream := WriteStream on: String new.
	aString asUppercase do: [ :char |
		stream nextPutAll: (mapping at: char ifAbsent: [ char ]) asString ].
	^ stream contents
]

{ #category : 'accessing' }
BioReducedAlphabet >> size [

	^ size
]

{ #category : 'accessing' }
BioReducedAlphabet >> source [

	^ source
]
