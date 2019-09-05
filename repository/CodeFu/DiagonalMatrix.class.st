Class {
	#name : #DiagonalMatrix,
	#superclass : #SymetricMatrix,
	#category : 'CodeFu'
}

{ #category : #'instance creation' }
DiagonalMatrix class >> withDiagonal: vector [

	| newMatrix |
	newMatrix := self new: vector size.
	1 to: vector size do: [ :index |
		newMatrix at: index and: index put: (vector at: index)
	].
	^newMatrix
]

{ #category : #accessing }
DiagonalMatrix >> at: row and: column [ 

	^row = column 
		ifTrue: [ partialColumns at: column ]	
		ifFalse: [ 0 ]
]

{ #category : #accessing }
DiagonalMatrix >> at: row and: column put: aNumber [

	^row = column 
		ifTrue: [ partialColumns at: column put: aNumber ]
		ifFalse: [ aNumber isZero ifFalse: [ self error: ('can not put <1p> off diagonal' expandMacrosWith: aNumber) ]. aNumber ]
]

{ #category : #private }
DiagonalMatrix >> checkInvariant [

	^partialColumns isCollection

	"(DiagonalMatrix new: 10) checkInvariant"
]

{ #category : #accessing }
DiagonalMatrix >> columnSize [

	^partialColumns size
]

{ #category : #'initialize-release' }
DiagonalMatrix >> initializeRows: m columns: n [

	m = n ifFalse: [ Array new noMatchError ].
	partialColumns := Array new: m.
	^self.
]

{ #category : #accessing }
DiagonalMatrix >> rowSize [

	^partialColumns size
]
