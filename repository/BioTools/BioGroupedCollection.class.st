"
A collection that supports grouped conversion operations. Extends BioOrderedCollection with grouping and clustering behavior.
"
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
