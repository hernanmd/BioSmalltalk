"
Represents an exon as a sequence feature. An exon is a coding region of a gene that is transcribed and contributes to the final mRNA product. Instance Variables: gene <BioGene> The parent gene. type <Symbol> Exon type (e.g., coding, non-coding). transcripts <Collection> Associated transcripts.
"
Class {
	#name : 'BioExon',
	#superclass : 'BioSequenceFeature',
	#instVars : [
		'gene',
		'type',
		'transcripts'
	],
	#category : 'BioTools-Sequences',
	#package : 'BioTools',
	#tag : 'Sequences'
}

{ #category : 'adding' }
BioExon >> addTranscript: aBioTranscript [

	self transcripts add: aBioTranscript
]

{ #category : 'accessing' }
BioExon >> gene [

	^ gene
]

{ #category : 'accessing' }
BioExon >> gene: anObject [

	gene := anObject
]

{ #category : 'accessing' }
BioExon >> transcripts [

	^ transcripts
		ifNil: [ transcripts := OrderedCollection new ]
]

{ #category : 'accessing' }
BioExon >> transcripts: anObject [

	transcripts := anObject
]

{ #category : 'accessing' }
BioExon >> type [

	^ type
]

{ #category : 'accessing' }
BioExon >> type: anObject [

	type := anObject
]
