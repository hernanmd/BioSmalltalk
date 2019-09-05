Class {
	#name : #VectorDecorator,
	#superclass : #Vector,
	#instVars : [
		'vector'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
VectorDecorator class >> on: aVector [

	^self basicNew
		setVector: aVector asVector;
		yourself.
]

{ #category : #accessing }
VectorDecorator >> at: index [

	^vector at: index
]

{ #category : #accessing }
VectorDecorator >> at: index put: aNumber [

	^vector at: index put: aNumber
]

{ #category : #'initialize-release' }
VectorDecorator >> initializeSize: aSize [

	^self shouldNotImplement
]

{ #category : #'initialize-release' }
VectorDecorator >> setVector: aVector [

	^vector := aVector
]

{ #category : #accessing }
VectorDecorator >> size [

	^vector size
]

{ #category : #private }
VectorDecorator >> species [

	^vector species
]
