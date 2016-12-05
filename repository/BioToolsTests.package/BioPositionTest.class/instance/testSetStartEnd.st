testing
testSetStartEnd

	position := BioLocus new 
		start: 10;
		end: 100;
		yourself.

	self assert: (position start isKindOf: Number).
	self assert: (position end isKindOf: Number).
	self assert: position start = 10.
	self assert: position end = 100.
