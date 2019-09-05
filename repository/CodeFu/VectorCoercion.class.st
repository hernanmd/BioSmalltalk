Class {
	#name : #VectorCoercion,
	#superclass : #Vector,
	#instVars : [
		'number'
	],
	#category : 'CodeFu'
}

{ #category : #'initialize-release' }
VectorCoercion class >> with: aNumber [

	^(aNumber isKindOf: Vector) 
		ifTrue: [ aNumber ]
		ifFalse: [ (self basicNew)
			setNumber: aNumber;
			yourself ]
]

{ #category : #converting }
VectorCoercion >> asNumber [

	^number
]

{ #category : #accessing }
VectorCoercion >> at: index [

	^number
]

{ #category : #testing }
VectorCoercion >> hasSize: aSize [

	^true
]

{ #category : #'initialize-release' }
VectorCoercion >> initializeSize: aSize [

	^self noDimensionError
]

{ #category : #private }
VectorCoercion >> noDimensionError [

	^self error: 'Coerced matrices do not have dimension.'
]

{ #category : #printing }
VectorCoercion >> printOn: aStream [ 

	aStream 
		print: self class; 
		nextPutAll: ' with: ';
		print: number
]

{ #category : #'initialize-release' }
VectorCoercion >> setNumber: aNumber [

	^number := aNumber
]

{ #category : #accessing }
VectorCoercion >> size [

	^self noDimensionError
]

{ #category : #'mathematical functions' }
VectorCoercion >> sum [

	^self noDimensionError
]

{ #category : #private }
VectorCoercion >> switch: matrix caseCoercion: coercionBlock caseVector: vectorBlock [

	^(matrix isKindOf: VectorCoercion)
		ifTrue: [ coercionBlock value ]
		ifFalse: [ vectorBlock value ]
]

{ #category : #enumerating }
VectorCoercion >> with: vector affect: aBlock [

	^self switch: vector
		caseCoercion: [ number := aBlock value: number value: vector asNumber ]
		caseVector: [ Error raise ].
]

{ #category : #enumerating }
VectorCoercion >> with: vector collect: aBlock [

	^self switch: vector
		caseCoercion: [ MatrixCoercion with: (aBlock value: number value: vector asNumber) ]
		caseVector: [ vector with: self collect: [ :a :b | aBlock value: b value: a ]].
]

{ #category : #enumerating }
VectorCoercion >> with: vector do: aBlock [

	^self switch: vector
		caseCoercion: [ aBlock value: number value: vector asNumber ]
		caseVector: [ vector with: self do: [ :a :b | aBlock value: b value: a ]].
]
