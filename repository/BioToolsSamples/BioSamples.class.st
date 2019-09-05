"
Abstract class for grouping common behavior of sample subclasses

"
Class {
	#name : #BioSamples,
	#superclass : #BioObject,
	#category : 'BioToolsSamples-Core'
}

{ #category : #'accessing private' }
BioSamples class >> allowOpenTranscript [

	^ true
]
