test
testArithmeticUnity
	| a |
	a := self matrixClass 
		new: 2
		withAll: #(1 2 3 4 ).
	self assert: FUMatrix unity * a = a.
	self assert: (FUMatrix unity + a) asArray = #(2 3 4 5 ).
	self assert: FUMatrix unity * FUMatrix unity = FUMatrix unity.
	self assert: (FUMatrix unity + FUMatrix unity) asNumber = 2.
	self assert: FUMatrix unity + FUMatrix zero = FUMatrix unity