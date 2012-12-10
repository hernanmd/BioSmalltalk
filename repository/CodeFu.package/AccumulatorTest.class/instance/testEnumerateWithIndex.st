test
testEnumerateWithIndex

	| a |
	a := Accumulator minimum.
	a enumerateWithIndex: #( 10 1 100).
	self assert: a index = 2.
	self assert: a value = 1.