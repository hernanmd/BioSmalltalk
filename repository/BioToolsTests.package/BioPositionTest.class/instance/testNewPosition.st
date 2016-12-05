testing
testNewPosition

	position := BioLocus new 
		value: 100;
		yourself.

	self assert: (position isKindOf: BioLocus).
	self assert: position value = 100.
