running
testPrune

	terms := Terms sample.

	self assert: terms distinctSize = 56.
	self assert: terms size = 76.

	terms prune.

	self assert: terms distinctSize = 3.
	self assert: terms size = 9.

	^terms