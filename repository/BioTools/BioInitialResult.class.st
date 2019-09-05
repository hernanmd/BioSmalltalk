Class {
	#name : #BioInitialResult,
	#superclass : #BioResultObject,
	#instVars : [
		'client',
		'reader'
	],
	#category : 'BioTools-Query'
}

{ #category : #'instance creation' }
BioInitialResult class >> newFrom: anObject [

	^ self basicNew initializeWith: anObject
]

{ #category : #accessing }
BioInitialResult >> client [
	^ client
]

{ #category : #accessing }
BioInitialResult >> client: anObject [
	client := anObject
]

{ #category : #'convenience-filesystem' }
BioInitialResult >> dumpToFileNamed: fileName [
	" Outputs the receiver's contents to a file named fileName "

	self 
		dumpToFileNamed: fileName 
		contents: self reader contents
]

{ #category : #'initialize-release' }
BioInitialResult >> initializeWith: aClient [
	" Private - Set the receiver's client "
	
	self initialize.
	self client: aClient.

]

{ #category : #private }
BioInitialResult >> reader [

	^ reader
		ifNil: [ reader := self readerClass new results: self result ]
]

{ #category : #accessing }
BioInitialResult >> reader: anObject [
	
	reader := anObject
]
