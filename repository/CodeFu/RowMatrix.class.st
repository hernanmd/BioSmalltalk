Class {
	#name : #RowMatrix,
	#superclass : #FUMatrix,
	#instVars : [
		'rows'
	],
	#category : 'CodeFu'
}

{ #category : #accessing }
RowMatrix >> at: row and: column [

	^(rows at: row) at: column
]

{ #category : #accessing }
RowMatrix >> at: row and: column put: aNumber [

	^(rows at: row) at: column put: aNumber
]

{ #category : #private }
RowMatrix >> checkInvariant [

	^rows isCollection and: [
		(rows allSatisfy: [ :row | row isKindOf: self vectorSpecies ]) and: [
			(rows allSatisfy: [ :row | row size = self columnSize ])]]
]

{ #category : #accessing }
RowMatrix >> columnSize [

	^rows isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ rows first size ]
]

{ #category : #'initialize-release' }
RowMatrix >> initializeRows: m columns: n [

	rows := Array new: m.
	1 to: m do: [ :index | rows at: index put: (self vectorSpecies new: n) ].
]

{ #category : #'accessing vectorwise' }
RowMatrix >> rowAt: rowIndex [

	^rows at: rowIndex
]

{ #category : #accessing }
RowMatrix >> rowSize [

	^rows size
]

{ #category : #'accessing vectorwise' }
RowMatrix >> rows [

	^rows
]
