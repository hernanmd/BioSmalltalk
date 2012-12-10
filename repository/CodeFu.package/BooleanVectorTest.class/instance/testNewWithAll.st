running
testNewWithAll

	v := BooleanVector new: 100 withAll: true.

	self assert: v size = 100.
	self assert: (v allSatisfy: #yourself)