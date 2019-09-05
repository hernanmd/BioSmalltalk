Class {
	#name : #UnitVector,
	#superclass : #VectorDecorator,
	#instVars : [
		'length'
	],
	#category : 'Hapax'
}

{ #category : #accessing }
UnitVector >> at: index [

	^(vector at: index) * length
]

{ #category : #accessing }
UnitVector >> at: index put: aNumber [

	^self noModificationError
]

{ #category : #'vector functions' }
UnitVector >> length [

	^length
]

{ #category : #'initialize-release' }
UnitVector >> setVector: aVector [

	length := aVector length.
	length isZero 
		ifTrue: [ vector := Vector new: aVector size withAll: 0. ]
		ifFalse: [ vector := (Vector new: aVector size) putWithIndex: [ :each | (aVector at: each) / length ]].
]

{ #category : #'vector functions' }
UnitVector >> similarity: aVector [

	^vector dotProduct: aVector unitVector
]

{ #category : #'vector functions' }
UnitVector >> unitVector [

	^vector
]
