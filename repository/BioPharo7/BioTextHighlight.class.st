Class {
	#name : #BioTextHighlight,
	#superclass : #TextHighlight,
	#instVars : [
		'colors'
	],
	#category : #'BioPharo7-Morphic'
}

{ #category : #accessing }
BioTextHighlight >> colors [
	^ colors
]

{ #category : #accessing }
BioTextHighlight >> colors: anObject [
	colors := anObject
]
