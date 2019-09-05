Class {
	#name : #ColumnMatrix,
	#superclass : #FUMatrix,
	#instVars : [
		'columns'
	],
	#category : 'CodeFu'
}

{ #category : #accessing }
ColumnMatrix >> at: row and: column [

	^(columns at: column) at: row
]

{ #category : #accessing }
ColumnMatrix >> at: row and: column put: aNumber [

	^(columns at: column) at: row put: aNumber
]

{ #category : #private }
ColumnMatrix >> checkInvariant [

	^columns isCollection and: [
		(columns allSatisfy: [ :vector | vector isKindOf: self vectorSpecies ]) and: [
			(columns allSatisfy: [ :vector | vector size = self rowSize ])]]
]

{ #category : #'accessing vectorwise' }
ColumnMatrix >> columnAt: column [

	^(columns at: column)
]

{ #category : #accessing }
ColumnMatrix >> columnSize [

	^columns size
]

{ #category : #'accessing vectorwise' }
ColumnMatrix >> columns [

	^columns
]

{ #category : #'initialize-release' }
ColumnMatrix >> initializeRows: m columns: n [

	columns := Array new: n.
	1 to: n do: [ :index | columns at: index put: (self vectorSpecies new: m) ].
]

{ #category : #accessing }
ColumnMatrix >> rowSize [

	^columns isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ columns last size ]
]
