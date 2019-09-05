Class {
	#name : #GlobalWeighting,
	#superclass : #Weighting,
	#instVars : [
		'globalFrequencies',
		'documentFrequencies'
	],
	#category : 'Hapax'
}

{ #category : #weighting }
GlobalWeighting >> documentFrequency: aVector [

	^aVector sparseSize
]

{ #category : #weighting }
GlobalWeighting >> forTerm: aVector [

	^self subclassResponsibility
]

{ #category : #weighting }
GlobalWeighting >> globalFrequency: aVector [

	^aVector sum
]
