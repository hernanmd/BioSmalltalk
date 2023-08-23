Class {
	#name : #BioSequenceFeatureFormatter,
	#superclass : #BioFileFormatter,
	#instVars : [
		'sequenceFeature'
	],
	#category : #'BioFormatters-Formatters'
}

{ #category : #'instance creation' }
BioSequenceFeatureFormatter class >> fromSequenceFeature: aBioSequenceFeature [
	" Answer a new instance of the receiver using information from aBioSequenceFeature "
	
	^ self new 
		sequenceFeature: aBioSequenceFeature;
		yourself
]

{ #category : #accessing }
BioSequenceFeatureFormatter >> sequenceFeature [
	^ sequenceFeature
]

{ #category : #accessing }
BioSequenceFeatureFormatter >> sequenceFeature: anObject [
	sequenceFeature := anObject
]
