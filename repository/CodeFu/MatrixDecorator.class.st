Class {
	#name : #MatrixDecorator,
	#superclass : #FUMatrix,
	#instVars : [
		'matrix'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
MatrixDecorator class >> on: aMatrix [

	^self basicNew
		setMatrix: aMatrix;
		yourself.
]

{ #category : #accessing }
MatrixDecorator >> at: row and: column [

	^matrix at: row and: column
]

{ #category : #accessing }
MatrixDecorator >> at: row and: column put: aNumber [

	^matrix at: row and: column put: aNumber
]

{ #category : #private }
MatrixDecorator >> checkInvariant [

	^matrix checkInvariant
]

{ #category : #accessing }
MatrixDecorator >> columnSize [

	^matrix columnSize
]

{ #category : #'initialize-release' }
MatrixDecorator >> initializeRows: m columns: n [

	self shouldNotImplement
]

{ #category : #accessing }
MatrixDecorator >> rowSize [

	^matrix rowSize
]

{ #category : #'initialize-release' }
MatrixDecorator >> setMatrix: aMatrix [

	^matrix := aMatrix
]

{ #category : #'initialize-release' }
MatrixDecorator >> species [

	^matrix species
]
