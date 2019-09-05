Class {
	#name : #MatrixCoercionTest,
	#superclass : #TestCase,
	#category : 'CodeFu'
}

{ #category : #test }
MatrixCoercionTest >> testFloat [

	| m n |
	m := ColumnMatrix new: 4@3 withAll: 2.
	n := 2.0.

	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.		
	m / n.
	n / m.
]

{ #category : #test }
MatrixCoercionTest >> testFraction [

	| m n |
	m := ColumnMatrix new: 4@3 withAll: 2.
	n := 1/2.

	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.		
	m / n.
	n / m.
]

{ #category : #test }
MatrixCoercionTest >> testInteger [

	| m n |
	m := ColumnMatrix new: 4@3 withAll: 2.
	n := 2.

	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.		
	m / n.
	n / m.
]

{ #category : #test }
MatrixCoercionTest >> testLargeInteger [

	| m n |
	m := ColumnMatrix new: 4@3 withAll: 2.
	n := 2000000000000.

	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.		
	m / n.
	n / m.
]

{ #category : #test }
MatrixCoercionTest >> testPoint [

	| m n |
	m := ColumnMatrix new: 4@3 withAll: 2.
	n := 2@2.

	m + n.
	n + m.
	m - n.
	n - m.
	m * n.
	n * m.		
	m / n.
	n / m.
]
