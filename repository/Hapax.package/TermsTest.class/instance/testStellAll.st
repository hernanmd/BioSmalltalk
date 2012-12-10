running
testStellAll

	terms := Terms sample.

	self assert: terms distinctSize = 56.
	self assert: terms size = 76.

	terms stemAll.

	self assert: terms distinctSize = 55.
	self assert: terms size = 76.

	^terms