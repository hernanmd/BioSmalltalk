"
A BioFilteredResult is a query results wrapper contained by a BioFilter.

Instance Variables
	filter:		<BioFilter>


"
Class {
	#name : #BioFilteredResult,
	#superclass : #BioResultObject,
	#instVars : [
		'filter'
	],
	#category : #'BioTools-Query'
}

{ #category : #accessing }
BioFilteredResult >> collect: aBlock [
	" self needsWork."

	^ self result collect: aBlock
]

{ #category : #'accessing private' }
BioFilteredResult >> definitionString [

	^ 'Filter'
]

{ #category : #accessing }
BioFilteredResult >> filter [
	^ filter
]

{ #category : #accessing }
BioFilteredResult >> filter: anObject [
	filter := anObject
]

{ #category : #printing }
BioFilteredResult >> printOn: aStream [
	" Private - Print the receiver's name and result size "
	
	super printOn: aStream.
	aStream
		space;
		nextPutAll: self size asString between: $[ and: $]
]
