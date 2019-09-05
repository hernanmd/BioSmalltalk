Class {
	#name : #MatrixTest,
	#superclass : #TestCase,
	#instVars : [
		'matrix1'
	],
	#category : 'CodeFu'
}

{ #category : #testing }
MatrixTest class >> isAbstract [

	^self name = #MatrixTest
]

{ #category : #fixture }
MatrixTest >> matrixClass [
	"comment stating purpose of message"

	^self subclassResponsibility
]

{ #category : #testing }
MatrixTest >> setUp [
	matrix1 := Matrix new: 2.
	matrix1 
		at: 1
		at: 1
		put: 1.
	matrix1 
		at: 1
		at: 2
		put: 3.
	matrix1 
		at: 2
		at: 1
		put: 2.
	matrix1 
		at: 2
		at: 2
		put: 4.
	matrix2 := Matrix new: 2.
	matrix2 
		at: 1
		at: 1
		put: 3.
	matrix2 
		at: 1
		at: 2
		put: 7.
	matrix2 
		at: 2
		at: 1
		put: 4.
	matrix2 
		at: 2
		at: 2
		put: 8
]

{ #category : #test }
MatrixTest >> testAccessors [
	"comment stating purpose of message"

	| m |
	m := self matrixClass new: 2@3.
	m at: 1 and: 2 put: 12. 
	m at: 2 and: 1 put: 21. 
	self assert: (m at:	1 and: 2) = 12.
	self assert: (m at:	2 and: 1) = 21.
	m at: 1 and: 3 put: 13.
	self assert: (m at: 1 and: 3) = 13.
	self assert: (m atPoint: 1@3) = 13.
]

{ #category : #test }
MatrixTest >> testAddWithMatrix [
	"comment stating purpose of message"

	| m n mn |
	m := self matrixClass withAll: #( #( 1 2 ) #( 3 4 ) #( 5 6 )).
	n := self matrixClass withAll: #( #( 10 20 ) #( 30 40 ) #( 50 60 )).
	mn := self matrixClass withAll: #( #( 11 22 ) #( 33 44 ) #( 55 66 )).

	self assert: (m + n) = mn.
	m += n.
	self assert: m = mn.
	self assert: n = (self matrixClass withAll: #( #( 10 20 ) #( 30 40 ) #( 50 60 ))).
]

{ #category : #test }
MatrixTest >> testAddWithNumber [
	"comment stating purpose of message"

	| m m10 |
	m := self matrixClass withAll: #( #( 1 2 ) #( 3 4 ) #( 5 6 )).
	m10 := (self matrixClass withAll: #( #( 11 12 ) #( 13 14 ) #( 15 16 ))).

	self assert: (m + 10) = m10.
	self assert: (10 + m) = m10.
	m += 10.
	self assert: m = m10.
]

{ #category : #test }
MatrixTest >> testArithmeticUnity [
	| a |
	a := self matrixClass 
		new: 2
		withAll: #(1 2 3 4 ).
	self assert: FUMatrix unity * a = a.
	self assert: (FUMatrix unity + a) asArray = #(2 3 4 5 ).
	self assert: FUMatrix unity * FUMatrix unity = FUMatrix unity.
	self assert: (FUMatrix unity + FUMatrix unity) asNumber = 2.
	self assert: FUMatrix unity + FUMatrix zero = FUMatrix unity
]

{ #category : #test }
MatrixTest >> testArithmeticZero [
	| a |
	a := self matrixClass 
		new: 2
		withAll: #(1 2 3 4 ).
	self assert: FUMatrix zero * a = FUMatrix zero.
	self assert: FUMatrix zero + a = a.
	self assert: FUMatrix zero * FUMatrix zero = FUMatrix zero.
	self assert: FUMatrix zero + FUMatrix zero = FUMatrix zero.
	self assert: FUMatrix unity * FUMatrix zero = FUMatrix zero
]

{ #category : #'tests - accessing' }
MatrixTest >> testAtAt [
	self should:[matrix1 at: 2 at: 3] raise: Error.
	self should:[matrix1 at: 3 at: 2] raise: Error.
	self should:[matrix1 at: 3 at: 3] raise: Error.
	self should:[matrix1 at: 0 at: 1] raise: Error.
	self should:[matrix1 at: 1 at: 0] raise: Error.
	self should:[matrix1 at: 0 at: 0] raise: Error.
	
	self assert: (matrix1 at: 1 at: 1) = 1
]

{ #category : #'tests - copying' }
MatrixTest >> testCopy [

	| copyMatrix |
	
	copyMatrix := matrix1 copy.
	self assert: matrix1 = copyMatrix 
]

{ #category : #test }
MatrixTest >> testDimension [
	"comment stating purpose of message"

	| m |
	m := self matrixClass new: 3@7.
	self assert: m rowSize = 3.
	self assert: m columnSize = 7.
	self assert: m dimension = (3@7).
]

{ #category : #'tests - testing' }
MatrixTest >> testIncludes [
	self assert:
			((1 to: 4)
				allSatisfy: [:i | matrix1 includes: i])

]

{ #category : #test }
MatrixTest >> testMatrixMultiplicationDimension [
	"comment stating purpose of message"

	| A B |
	A := self matrixClass withAll: #( #(1 2 3) #(4 5 6) ).
	B := self matrixClass withAll: #( #(6 -1) #(3 2) #(0 -3) ).

	self assert: (A *~ B) dimension = (2@2).
	self assert: (B *~ A) dimension = (3@3).
	self assert: (A transposed *~ A) dimension = (3@3).
	self assert: (B transposed *~ B) dimension = (2@2).
]

{ #category : #test }
MatrixTest >> testMatrixMultiplicationValues [
	"comment stating purpose of message"

	| A B |
	A := self matrixClass withAll: #( #(1 2 3) #(4 5 6) ).
	B := self matrixClass withAll: #( #(6 -1) #(3 2) #(0 -3) ).

	self assert: (A *~ B) = (self matrixClass withAll: #((12 -6) (39 -12))).
	self assert: (B *~ A) = (self matrixClass withAll: #((2 7 12) (11 16 21) (-12 -15 -18))).
	self assert: (A transposed *~ A) = (self matrixClass withAll: #((17 22 27) (22 29 36) (27 36 45))).
	self assert: (B transposed *~ B) = (self matrixClass withAll: #((45 0) (0 14))).
]

{ #category : #test }
MatrixTest >> testMultWithMatrix [
	"comment stating purpose of message"

	| m n mn |
	m := self matrixClass withAll: #( #( 1 2 ) #( 3 4 ) #( 5 6 )).
	n := self matrixClass withAll: #( #( 10 20 ) #( 30 40 ) #( 50 60 )).
	mn := self matrixClass withAll: #( #( 10 40 ) #( 90 160 ) #( 250 360 )).

	self assert: (m * n) = mn.
	m *= n.
	self assert: m = mn.
	self assert: n = (self matrixClass withAll: #( #( 10 20 ) #( 30 40 ) #( 50 60 ))).
]

{ #category : #test }
MatrixTest >> testMultWithNumber [
	"comment stating purpose of message"

	| m m10 |
	m := self matrixClass withAll: #( #( 1 2 ) #( 3 4 ) #( 5 6 )).
	m10 := (self matrixClass withAll: #( #( 10 20 ) #( 30 40 ) #( 50 60 ))).

	self assert: (m * 10) = m10.
	self assert: (10 * m) = m10.
	m *= 10.
	self assert: m = m10.
]

{ #category : #'tests - arithmetic' }
MatrixTest >> testMultiply [
	| result |
	self 
		should: [ matrix1 preMultiplyByMatrix: (Matrix new: 3) ]
		raise: Error.
	result := matrix2 preMultiplyByMatrix: matrix1.
	self assert: (result 
			at: 1
			at: 1) = 15.
	self assert: (result 
			at: 1
			at: 2) = 31.
	self assert: (result 
			at: 2
			at: 1) = 22.
	self assert: (result 
			at: 2
			at: 2) = 46
]

{ #category : #test }
MatrixTest >> testReadDenseTextFrom [

	| matrix text stream |
	matrix := ArrayMatrix withAll: #( ( 2.3 0 4.2 ) ( 0 1.3 2.2 ) ( 3.8 0 0.5 ) ( 0 0 0 )).
	text := '4 3\2.3 0 4.2\0 1.3 2.2\3.8 0 0.5\0 0 0\' withCRs.

	stream := ReadStream on: text.
	self assert: matrix = (self matrixClass readFromDenseText: stream).
]

{ #category : #test }
MatrixTest >> testReadSparseTextFrom [

	| matrix text stream |
	matrix := ArrayMatrix withAll: #( ( 2.3 0 4.2 ) ( 0 1.3 2.2 ) ( 3.8 0 0.5 ) ( 0 0 0 )).
	text := '4 3 6\2\0 2.3\2 3.8\1\1 1.3\3\0 4.2\1 2.2\2 0.5\' withCRs.

	stream := ReadStream on: text.
	self assert: matrix = (self matrixClass readFromSparseText: stream).
]

{ #category : #'tests - accessing' }
MatrixTest >> testReplaceAll [

	matrix1 replaceAll: 1 with: 10.
	self assert: (matrix1 at:1 at:1) = 10.
	self assert: (matrix1 at:2 at:1) = 2.
	self assert: (matrix1 at:1 at:2) = 3.
	self assert: (matrix1 at:2 at:2) = 4.
]

{ #category : #test }
MatrixTest >> testRowColumnSize [
	"comment stating purpose of message"

	| m |
	m := self matrixClass rows: 3 columns: 7.
	self assert: m rowSize = 3.
	self assert: m columnSize = 7.
	self assert: m dimension = (3@7).
]

{ #category : #test }
MatrixTest >> testStoreDenseTextOn [

	| matrix text stream |
	matrix := self matrixClass withAll: #( ( 2.3 0 4.2 ) ( 0 1.3 2.2 ) ( 3.8 0 0.5 ) ( 0 0 0 )).
	text := '4 3\2.3 0 4.2\0 1.3 2.2\3.8 0 0.5\0 0 0\' withCRs.

	stream := WriteStream on: String new.
	matrix storeDenseTextOn: stream.
	self assert: stream contents = text.
]

{ #category : #test }
MatrixTest >> testStoreSparseTextOn [

	| matrix text stream |
	matrix := self matrixClass withAll: #( ( 2.3 0 4.2 ) ( 0 1.3 2.2 ) ( 3.8 0 0.5 ) ( 0 0 0 )).
	text := '4 3 6\2\0 2.3\2 3.8\1\1 1.3\3\0 4.2\1 2.2\2 0.5\' withCRs.

	stream := WriteStream on: String new.
	matrix storeSparseTextOn: stream.
	self assert: stream contents = text.
]

{ #category : #'tests - accessing' }
MatrixTest >> testSwap [
	matrix1 swap: 1 at: 2 with: 1 at: 1.
	self assert: (matrix1 at: 1 at: 1) = 3.
	self assert: (matrix1 at: 1 at: 2) = 1.
]

{ #category : #'tests - accessing' }
MatrixTest >> testTransposed [
	| transposedMatrix |
	
	transposedMatrix := matrix1 transposed.
	self assert: (transposedMatrix at:1 at:1) = 1.
	self assert: (transposedMatrix at:1 at:2) = 2.
	self assert: (transposedMatrix at:2 at:1) = 3.
	self assert: (transposedMatrix at:2 at:2) = 4.
]
