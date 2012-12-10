test
testArithmeticZero
	| a |
	a := self matrixClass 
		new: 2
		withAll: #(1 2 3 4 ).
	self assert: FUMatrix zero * a = FUMatrix zero.
	self assert: FUMatrix zero + a = a.
	self assert: FUMatrix zero * FUMatrix zero = FUMatrix zero.
	self assert: FUMatrix zero + FUMatrix zero = FUMatrix zero.
	self assert: FUMatrix unity * FUMatrix zero = FUMatrix zero