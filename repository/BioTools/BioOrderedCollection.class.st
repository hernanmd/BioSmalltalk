"
Represents a collection which is intended to hold objects used by BioSmalltalk. Objects contained can be iterated, parsed or converted. See specific subclasses for use cases.
"
Class {
	#name : #BioOrderedCollection,
	#superclass : #OrderedCollection,
	#category : 'BioTools-Collections'
}

{ #category : #testing }
BioOrderedCollection >> isBioCollection [
	" Answer <true> if receiver is a <Collection> provided by the BioSmalltalk library "

	^ true
]

{ #category : #accessing }
BioOrderedCollection >> result [

	^ self
]
