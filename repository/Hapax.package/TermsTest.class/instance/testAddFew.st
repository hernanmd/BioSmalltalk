running
testAddFew

	terms := Terms fromString: 'and the super of a'.

	self assert: terms size = 5.
	self assert: terms distinctSize = 5.

	^terms