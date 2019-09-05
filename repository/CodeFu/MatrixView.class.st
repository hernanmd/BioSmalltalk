Class {
	#name : #MatrixView,
	#superclass : #MatrixDecorator,
	#instVars : [
		'rowSize',
		'columnSize',
		'mapBlock'
	],
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
MatrixView class >> from: top to: bottom on: matrix [

	^(self new: bottom - top + 1)
		setMatrix: matrix;
		setMapBlock: [ :row :column | row@column - top + 1 ];
		yourself
]

{ #category : #'As yet unclassified' }
MatrixView class >> fromColumn: start to: end on: matrix [ 
	^self 
		from: 1
		to: matrix rowSize @ end
		on: matrix
]

{ #category : #'instance creation' }
MatrixView class >> transposeOn: matrix [

	^(self new: matrix dimension transpose)
		setMatrix: matrix;
		setMapBlock: [ :row :column | column @ row ];
		yourself
]

{ #category : #accessing }
MatrixView >> at: row and: column [

	^matrix atPoint: (mapBlock value: row value: column)
]

{ #category : #accessing }
MatrixView >> at: row and: column put: aNumber [

	self noModificationError
]

{ #category : #accessing }
MatrixView >> columnSize [

	^columnSize
]

{ #category : #'initialize-release' }
MatrixView >> initializeRows: m columns: n [

	rowSize := m.
	columnSize := n.
]

{ #category : #accessing }
MatrixView >> rowSize [

	^rowSize
]

{ #category : #'initialize-release' }
MatrixView >> setMapBlock: block [

	^mapBlock := block
]
