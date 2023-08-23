"
A chromosome fragment can associate to sequences by recording the start and end positions of the sequence of each fragment. Chromosome fragments may overlap.

A chromosome fragment understands the #genes message to answer a collection of known genes.


Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #BioChromosomeFragment,
	#superclass : #BioNamedObject,
	#instVars : [
		'start',
		'end'
	],
	#category : #'BioTools-Biological'
}

{ #category : #comparing }
BioChromosomeFragment >> = aBioChromosomeFragment [
	"Answer <true> if the receiver is equal to aBioChromosomeFragment"
	
	self == aBioChromosomeFragment 
		ifTrue: [ ^ true ].
	self class = aBioChromosomeFragment class
		ifFalse: [ ^ false ].
	(self start = aBioChromosomeFragment start and: [ self end = aBioChromosomeFragment end ])
		ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
BioChromosomeFragment >> end [
	^ end
]

{ #category : #accessing }
BioChromosomeFragment >> end: anObject [
	end := anObject
]

{ #category : #comparing }
BioChromosomeFragment >> hash [
	" Private - hash is implemented because #= is implemented "
	
	^ self start hash bitXor: self end hash

]

{ #category : #accessing }
BioChromosomeFragment >> start [
	^ start
]

{ #category : #accessing }
BioChromosomeFragment >> start: anObject [
	start := anObject
]
