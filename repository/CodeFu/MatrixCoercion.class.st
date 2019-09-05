Class {
	#name : #MatrixCoercion,
	#superclass : #FUMatrix,
	#instVars : [
		'number'
	],
	#category : 'CodeFu'
}

{ #category : #'initialize-release' }
MatrixCoercion class >> with: aNumber [ 
	^ (aNumber isKindOf: FUMatrix) 
		ifTrue: [ aNumber ]
		ifFalse: 
			[ self basicNew
				setNumber: aNumber ;
				yourself ]
]

{ #category : #comparing }
MatrixCoercion >> = matrix [

	^self switch: matrix
		caseCoercion: [ number = matrix asNumber ]
		caseMatrix: [ matrix = self ].
]

{ #category : #converting }
MatrixCoercion >> asNumber [

	^number
]

{ #category : #accessing }
MatrixCoercion >> at: row and: column [

	^number
]

{ #category : #private }
MatrixCoercion >> checkInvariant [

	^number respondsToArithmetic
]

{ #category : #accessing }
MatrixCoercion >> columnSize [

	self noDimensionError
]

{ #category : #testing }
MatrixCoercion >> hasDimension: aDimension [

	^true
]

{ #category : #'initialize-release' }
MatrixCoercion >> initializeRows: m columns: n [

	^self noDimensionError
]

{ #category : #private }
MatrixCoercion >> noDimensionError [

	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
MatrixCoercion >> printOn: aStream [ 
	"Append to the argument aStream a sequence of characters that identifies the matrix."

	aStream 
		print: self class; 
		nextPutAll: ' with: ';
		print: number
]

{ #category : #accessing }
MatrixCoercion >> rowSize [

	self noDimensionError
]

{ #category : #'initialize-release' }
MatrixCoercion >> setNumber: aNumber [

	^number := aNumber
]

{ #category : #private }
MatrixCoercion >> switch: matrix caseCoercion: coercionBlock caseMatrix: matrixBlock [

	^(matrix isKindOf: MatrixCoercion)
		ifTrue: [ coercionBlock value ]
		ifFalse: [ matrixBlock value ]
]

{ #category : #enumerating }
MatrixCoercion >> with: matrix affect: aBlock [

	^self switch: matrix
		caseCoercion: [ number := aBlock value: number value: matrix asNumber ]
		caseMatrix: [ Error raise ].
]

{ #category : #enumerating }
MatrixCoercion >> with: matrix collect: aBlock [

	^self switch: matrix
		caseCoercion: [ MatrixCoercion with: (aBlock value: number value: matrix asNumber) ]
		caseMatrix: [ matrix with: self collect: [ :a :b | aBlock value: b value: a ]].
]

{ #category : #enumerating }
MatrixCoercion >> with: matrix do: aBlock [

	^self switch: matrix
		caseCoercion: [ aBlock value: number value: matrix asNumber ]
		caseMatrix: [ matrix with: self do: [ :a :b | aBlock value: b value: a ]].
]
