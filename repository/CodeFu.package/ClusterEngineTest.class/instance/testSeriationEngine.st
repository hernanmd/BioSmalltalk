testing
testSeriationEngine

	| input output |
	input := #(1 2 3 5 11 12 15 21 22 23 25 31 32 35 41 42 43 45 47).
	output := SeriationEngine applyOn: input asArray shuffle.
	self assert: (output = input) | (output reverse = input).