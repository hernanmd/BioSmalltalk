test
testMatrixMultiplicationValues
	"comment stating purpose of message"

	| A B |
	A := self matrixClass withAll: #( #(1 2 3) #(4 5 6) ).
	B := self matrixClass withAll: #( #(6 -1) #(3 2) #(0 -3) ).

	self assert: (A *~ B) = (self matrixClass withAll: #((12 -6) (39 -12))).
	self assert: (B *~ A) = (self matrixClass withAll: #((2 7 12) (11 16 21) (-12 -15 -18))).
	self assert: (A transposed *~ A) = (self matrixClass withAll: #((17 22 27) (22 29 36) (27 36 45))).
	self assert: (B transposed *~ B) = (self matrixClass withAll: #((45 0) (0 14))).