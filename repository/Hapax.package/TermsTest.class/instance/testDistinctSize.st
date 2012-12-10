running
testDistinctSize

	terms := Terms sample.

	self assert: terms distinctSize = 56.

	^terms