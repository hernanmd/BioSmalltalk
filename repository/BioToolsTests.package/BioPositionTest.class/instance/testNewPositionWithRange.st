testing
testNewPositionWithRange

	position := BioPosition new 
		start: 100;
		length: 10;
		yourself.

	self assert: position start = 100.
	self assert: position length = 10.
