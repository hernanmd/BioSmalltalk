Class {
	#name : #NullGlobalWeighting,
	#superclass : #GlobalWeighting,
	#category : 'Hapax'
}

{ #category : #accessing }
NullGlobalWeighting >> abbreviation [

	^nil
]

{ #category : #weighting }
NullGlobalWeighting >> forTerm: aVector [

	^1
]
