"
A BioTranscript is a set of `BioExon`.
"
Class {
	#name : #BioTranscript,
	#superclass : #BioSequenceFeature,
	#instVars : [
		'exons'
	],
	#category : #'BioTools-Sequences'
}

{ #category : #accessing }
BioTranscript >> exons [

	^ exons
]

{ #category : #accessing }
BioTranscript >> exons: anObject [

	exons := anObject
]
