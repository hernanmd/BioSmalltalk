Class {
	#name : #Entropy,
	#superclass : #RealEntropy,
	#category : 'Hapax'
}

{ #category : #accessing }
Entropy >> abbreviation [

	^'entropy'
]

{ #category : #weighting }
Entropy >> forTerm: aVector [

	^1 - ((super forTerm: aVector) / (aVector size log: 2))
]
