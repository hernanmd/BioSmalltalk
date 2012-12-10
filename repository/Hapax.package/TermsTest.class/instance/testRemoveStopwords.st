running
testRemoveStopwords

	terms := Terms sample.
	self assert: terms distinctSize = 56.
	terms removeEnglishStopwords.
	self assert: terms distinctSize = 24.

	^terms