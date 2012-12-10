test
testAverage

	| a |
	a := Accumulator sum.
	a accumulate: 10.
	self assert: a average = 10.
	a accumulate: 1.
	self assert: a average = (11/2).
	a accumulate: 100.
	self assert: a average = (111/3).