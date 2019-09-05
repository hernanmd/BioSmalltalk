Class {
	#name : #ArrayMatrix,
	#superclass : #FUMatrix,
	#instVars : [
		'array',
		'columnSize',
		'rowSize'
	],
	#category : 'CodeFu'
}

{ #category : #accessing }
ArrayMatrix >> at: row and: column [

	^array at: ((row - 1) * self columnSize) + column
]

{ #category : #accessing }
ArrayMatrix >> at: row and: column put: aNumber [

	^array at: ((row - 1) * self columnSize) + column put: aNumber
]

{ #category : #private }
ArrayMatrix >> checkInvariant [

	^array isCollection and: [ array size = rowSize * columnSize ]
]

{ #category : #accessing }
ArrayMatrix >> columnSize [

	^columnSize
]

{ #category : #'initialize-release' }
ArrayMatrix >> initializeRows: n columns: m [

	rowSize := n.
	columnSize := m.
	array := Array new: n * m.
	^self
]

{ #category : #accessing }
ArrayMatrix >> rowSize [

	^rowSize
]
