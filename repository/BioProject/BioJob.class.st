"
A job contains sequences and results, and it is one in which you can use to represent a repeatable task.

See BioProject class for details

"
Class {
	#name : #BioJob,
	#superclass : #Object,
	#instVars : [
		'sequences',
		'searchResults'
	],
	#category : 'BioProject-Core'
}

{ #category : #'accessing private' }
BioJob >> addResult: aString [
	" Private - "

	self searchResults add: aString
]

{ #category : #accessing }
BioJob >> addResults: anObject [
	" Add anObject to the receiver's results. Answer the newly created search result "
	
	^ (self createResultFrom: anObject) addToProject: self

]

{ #category : #accessing }
BioJob >> addSequence: aBioSequence [
	" Add aBioSequence to the receiver's sequences "
	
	^ (self sequences includes: aBioSequence) 
		ifFalse: [ self sequences addLast: aBioSequence ]
		ifTrue: [ self signalDuplicateObject: aBioSequence name ]
]

{ #category : #'accessing private' }
BioJob >> createResultFrom: aString [
	" Create and answer a new search result for aString "
	
	^ BioResultObject new
		project: self;
		result: aString;
		yourself
]

{ #category : #testing }
BioJob >> includesSequence: aBioSequence [
	" Answer <true> if receiver contains aBioSequence "
	
	^ self sequences includes: aBioSequence
]

{ #category : #printing }
BioJob >> printOn: aStream [
	" Private - See superimplementor's comment "
	
	super printOn: aStream.
	aStream 
		nextPutAll: self sequenceCount asString between: $[ and: $].
]

{ #category : #accessing }
BioJob >> removeSearchResult: aBioNamedObject [
	" Remove aBioObject from the receiver's sequences "

	self sequences 
		remove: aBioNamedObject
		ifAbsent: [ self signalNotFound: aBioNamedObject name ]
]

{ #category : #accessing }
BioJob >> removeSequence: aBioSequence [
	" Remove aGTSequence from the receiver's sequences "

	self sequences 
		remove: aBioSequence
		ifAbsent: [ self signalNotFound: aBioSequence name ]
]

{ #category : #accessing }
BioJob >> searchResults [

	^ searchResults
		ifNil: [ searchResults := OrderedCollection new ]
]

{ #category : #accessing }
BioJob >> searchResults: anObject [
	searchResults := anObject
]

{ #category : #accessing }
BioJob >> searchResultsCount [
	" Answer a <Number> with the size of the receiver's results "

	^ self searchResults size
]

{ #category : #accessing }
BioJob >> sequenceCount [
	" Answer how many sequences contain the receiver "

	^ self sequences size
]

{ #category : #accessing }
BioJob >> sequences [

	^ sequences
		ifNil: [ sequences := OrderedCollection new ]
]

{ #category : #accessing }
BioJob >> sequences: aCollection [
	" Set the receiver's sequences to be aCollection "
	
	sequences := aCollection
]
