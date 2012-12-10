test
testMatrixMultiplicationDimension
	"comment stating purpose of message"

	| A B |
	A := self matrixClass withAll: #( #(1 2 3) #(4 5 6) ).
	B := self matrixClass withAll: #( #(6 -1) #(3 2) #(0 -3) ).

	self assert: (A *~ B) dimension = (2@2).
	self assert: (B *~ A) dimension = (3@3).
	self assert: (A transposed *~ A) dimension = (3@3).
	self assert: (B transposed *~ B) dimension = (2@2).