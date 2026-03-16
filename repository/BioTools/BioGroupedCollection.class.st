Class {
	#name : 'BioGroupedCollection',
	#superclass : 'BioOrderedCollection',
	#category : 'BioTools-Collections',
	#package : 'BioTools',
	#tag : 'Collections'
}

{ #category : 'converting' }
BioGroupedCollection >> asString [

	^ self anyOne asString
]
