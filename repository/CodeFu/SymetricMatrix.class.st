Class {
	#name : #SymetricMatrix,
	#superclass : #FUMatrix,
	#instVars : [
		'partialColumns'
	],
	#category : 'CodeFu'
}

{ #category : #accessing }
SymetricMatrix >> at: row and: column [

	^row < column 
		ifTrue: [ (partialColumns at: column) at: row ]
		ifFalse: [ (partialColumns at: row) at: column ]
]

{ #category : #accessing }
SymetricMatrix >> at: row and: column put: aNumber [

	^row < column 
		ifTrue: [ (partialColumns at: column) at: row put: aNumber ]
		ifFalse: [ (partialColumns at: row) at: column put: aNumber ]
]

{ #category : #private }
SymetricMatrix >> checkInvariant [

	^partialColumns isCollection and: [
		(partialColumns allSatisfy: [ :vector | vector isKindOf: self vectorSpecies ]) and: [
			((1 to: self columnSize) allSatisfy: [ :index | (partialColumns at: index) size = index ])]]


	"(SymetricMatrix new: 10) checkInvariant"
]

{ #category : #accessing }
SymetricMatrix >> columnSize [

	^partialColumns size
]

{ #category : #'initialize-release' }
SymetricMatrix >> initializeRows: m columns: n [

	m = n ifFalse: [ Array new noMatchError ].
	partialColumns := Array new: n.
	1 to: n do: [ :index | partialColumns at: index put: (self vectorSpecies new: index) ].
]

{ #category : #testing }
SymetricMatrix >> isSquare [
	"Each symatric matrix is square."

	^true
]

{ #category : #testing }
SymetricMatrix >> isSymetric [
	"Each symetric matrix is symatric."

	^true
]

{ #category : #accessing }
SymetricMatrix >> rowSize [

	^partialColumns size "since we are square"
]

{ #category : #'matrix functions' }
SymetricMatrix >> transposed [
	"Answer self, since symatric matrices are invariant under transposition."

	^self
]

{ #category : #enumerating }
SymetricMatrix >> upperTriangleDoWithIndices: aBlock [

	1 to: self columnSize do: [ :column |
		1 to: column do: [ :row |
			aBlock value: (self at: row and: column) value: row value: column.
		]
	]
]
