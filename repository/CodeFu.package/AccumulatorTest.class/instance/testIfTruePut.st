test
testIfTruePut

	| a |
	a := Accumulator maximum.
	a accumulate: 10 withIndex: 'first'.
	self assert: a index = 'first'.
	self assert: a value = 10.
	a accumulate: 1 withIndex: 'second'.
	self assert: a index = 'first'.
	self assert: a value = 10.
	a accumulate: 100 withIndex: 'third'.
	self assert: a index = 'third'.
	self assert: a value = 100.