Class {
	#name : #BioExon,
	#superclass : #BioSequenceFeature,
	#instVars : [
		'gene',
		'type',
		'transcripts'
	],
	#category : #'BioTools-Sequences'
}

{ #category : #adding }
BioExon >> addTranscript: aBioTranscript [

	self transcripts add: aBioTranscript
]

{ #category : #accessing }
BioExon >> gene [

	^ gene
]

{ #category : #accessing }
BioExon >> gene: anObject [

	gene := anObject
]

{ #category : #accessing }
BioExon >> transcripts [

	^ transcripts
		ifNil: [ transcripts := OrderedCollection new ]
]

{ #category : #accessing }
BioExon >> transcripts: anObject [

	transcripts := anObject
]

{ #category : #accessing }
BioExon >> type [

	^ type
]

{ #category : #accessing }
BioExon >> type: anObject [

	type := anObject
]
