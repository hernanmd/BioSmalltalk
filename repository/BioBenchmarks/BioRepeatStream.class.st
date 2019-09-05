Class {
	#name : #BioRepeatStream,
	#superclass : #ReadStream,
	#instVars : [
		'repeatPtr',
		'repeatLimit'
	],
	#category : 'BioBenchmarks-Fasta'
}

{ #category : #'instance creation' }
BioRepeatStream class >> to: anInteger on: aCollection [

   ^ (super on: aCollection) to: anInteger
]

{ #category : #testing }
BioRepeatStream >> atEnd [

	^ repeatPtr >= repeatLimit
]

{ #category : #accessing }
BioRepeatStream >> next [

	position >= readLimit ifTrue: [ self position: 0 ].
	repeatPtr := repeatPtr + 1.
	^ collection at: (position := position + 1)
]

{ #category : #'initialize-release' }
BioRepeatStream >> to: anInteger [

	repeatPtr := 0.
	repeatLimit := anInteger
]
