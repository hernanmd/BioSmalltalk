testing
testNewPosition

	position := BioPosition new 
		value: 100;
		yourself.

	self assert: (position isKindOf: BioPosition).
	self assert: position value = 100.
