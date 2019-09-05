"
A BioWebResult represents the output from a web query.

"
Class {
	#name : #BioWebResult,
	#superclass : #BioInitialResult,
	#category : #'BioTools-Query'
}

{ #category : #accessing }
BioWebResult >> executeFor: aClient [
	" Private - Perform the actual search. Answer the receiver "
	
	^ self result: aClient url activate
]
