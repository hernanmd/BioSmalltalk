Class {
	#name : #BioGroupedCollection,
	#superclass : #BioOrderedCollection,
	#category : 'BioTools-Collections'
}

{ #category : #converting }
BioGroupedCollection >> asString [

	^ self anyOne asString
]
