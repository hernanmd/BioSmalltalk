Class {
	#name : #ArrayMatrixTest,
	#superclass : #MatrixTest,
	#category : 'CodeFu'
}

{ #category : #fixture }
ArrayMatrixTest >> matrixClass [

	^ArrayMatrix
]

{ #category : #test }
ArrayMatrixTest >> testDeterminant [
	| matrix |

	matrix := ArrayMatrix rows: 3 columns: 3.
	self assertBlock: [matrix determinant] raises: AssertionFailure.

	matrix := ArrayMatrix rows: 2 columns: 2 withAll: #(3 6 9 2).
	self assert: matrix determinant = -48.
]
