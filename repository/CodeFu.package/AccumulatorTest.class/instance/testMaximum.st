test
testMaximum

	| a |
	a := Accumulator maximum.
	a accumulate: 10.
	self assert: a value = 10.
	a accumulate: 1.
	self assert: a value = 10.
	a accumulate: 100.
	self assert: a value = 100.