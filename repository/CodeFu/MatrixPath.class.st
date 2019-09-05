Class {
	#name : #MatrixPath,
	#superclass : #Vector,
	#instVars : [
		'matrix',
		'mapBlock',
		'size'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
MatrixPath class >> column: columnIndex on: matrix [ 

	^(super new: matrix rowSize)
		setMatrix: matrix;
		setMapBlock: [ :index | index @ columnIndex ];
		yourself
]

{ #category : #'instance creation' }
MatrixPath class >> diagonalOn: matrix [

	[ matrix isSquare ] assert.
	^(super new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [ :index | index @ index ];
		yourself
]

{ #category : #'instance creation' }
MatrixPath class >> row: rowIndex on: matrix [

	^(super new: matrix columnSize)
		setMatrix: matrix;
		setMapBlock: [ :index | rowIndex @ index ];
		yourself
]

{ #category : #accessing }
MatrixPath >> at: index [

	^matrix atPoint: (mapBlock value: index)
]

{ #category : #accessing }
MatrixPath >> at: index put: aNumber [

	^matrix atPoint: (mapBlock value: index) put: aNumber
]

{ #category : #'initialize-release' }
MatrixPath >> initializeSize: aSize [

	^size := aSize
]

{ #category : #'initialize-release' }
MatrixPath >> setMapBlock: aBlock [

	^mapBlock := aBlock
]

{ #category : #'initialize-release' }
MatrixPath >> setMatrix: aMatrix [

	^matrix := aMatrix
]

{ #category : #accessing }
MatrixPath >> size [

	^size
]

{ #category : #'initialize-release' }
MatrixPath >> species [

	^matrix vectorSpecies
]
