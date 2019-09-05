"
Helper class for #disambiguate method.

Implementation taken from pytools package

https://github.com/laserson/pytools/blob/master/degex.py

"
Class {
	#name : #BioDFSNode,
	#superclass : #BioObject,
	#instVars : [
		'visited',
		'neighbors',
		'cumulSeq',
		'remainSeq'
	],
	#category : #'BioTools-Helpers'
}

{ #category : #'instance creation' }
BioDFSNode class >> newWith: aString remaining: aCollection [

	^ self new 
		initializeCumulative: aString remaining: aCollection;
		yourself
]

{ #category : #accessing }
BioDFSNode >> beVisited [

	visited := true
]

{ #category : #accessing }
BioDFSNode >> cumulSeq [
	^ cumulSeq
]

{ #category : #accessing }
BioDFSNode >> cumulSeq: anObject [
	cumulSeq := anObject
]

{ #category : #initialize }
BioDFSNode >> initializeCumulative: cum remaining: rem [

	visited := false.
	neighbors := OrderedCollection new.
	cumulSeq :=  cum.
	remainSeq := rem
]

{ #category : #accessing }
BioDFSNode >> isVisited [

	^ visited
]

{ #category : #accessing }
BioDFSNode >> neighbors [
	^ neighbors
]

{ #category : #accessing }
BioDFSNode >> neighbors: anObject [
	neighbors := anObject
]

{ #category : #accessing }
BioDFSNode >> remainSeq [
	^ remainSeq
]

{ #category : #accessing }
BioDFSNode >> remainSeq: anObject [
	remainSeq := anObject
]

{ #category : #accessing }
BioDFSNode >> remainingSeqAt: index [

	^ self remainSeq at: index
]

{ #category : #accessing }
BioDFSNode >> remainingSeqSize [

	^ self remainSeq size
]
