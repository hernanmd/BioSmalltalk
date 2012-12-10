running
testNewLarge

	v := BooleanVector new: 100.

	self assert: v size = 100.
	self assert: (v allSatisfy: #not)