"
Represents a sequence with residue quality and trace values

Instance Variables:
	qual	<Collection>
	trace	<Collection>
"
Class {
	#name : #BioSeqQuality,
	#superclass : #BioSequence,
	#instVars : [
		'qual',
		'trace'
	],
	#category : #'BioTools-Sequences'
}

{ #category : #accessing }
BioSeqQuality >> qual [
	^ qual
]

{ #category : #accessing }
BioSeqQuality >> qual: anObject [
	qual := anObject
]

{ #category : #accessing }
BioSeqQuality >> qualText [
	" Answer a <String> representation  of meta data "
	
	^ qual
]

{ #category : #accessing }
BioSeqQuality >> trace [
	^ trace
]

{ #category : #accessing }
BioSeqQuality >> trace: anObject [
	trace := anObject
]
