test
testEnumerate

	| a |
	a := Accumulator minimum.
	a enumerate: #( 10 1 100).
	self assert: a value = 1.