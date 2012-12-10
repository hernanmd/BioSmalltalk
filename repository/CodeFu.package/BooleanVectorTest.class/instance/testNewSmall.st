running
testNewSmall

	v := BooleanVector new: 5.

	self assert: v size = 5.
	self assert: (v allSatisfy: #not)