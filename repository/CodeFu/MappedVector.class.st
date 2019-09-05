Class {
	#name : #MappedVector,
	#superclass : #VectorDecorator,
	#instVars : [
		'indices'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
MappedVector class >> on: aVector [

	^self on: aVector indices: nil
]

{ #category : #'instance creation' }
MappedVector class >> on: aVector indices: aReindexing [

	^(super on: aVector)
		setIndices: aReindexing;
		yourself.
]

{ #category : #accessing }
MappedVector >> at: anIndex [

	^vector at: (indices at: anIndex)
]

{ #category : #accessing }
MappedVector >> at: anIndex put: aNumber [

	^vector at: (indices at: anIndex) put: aNumber
]

{ #category : #'initialize-release' }
MappedVector >> setIndices: aReindexing [

	indices := aReindexing ifNil: [ NumberMapping new: vector size ]
]

{ #category : #accessing }
MappedVector >> size [

	^indices size
]
