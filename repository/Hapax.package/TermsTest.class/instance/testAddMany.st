running
testAddMany

	terms := Terms fromString: 'and the super of the a of the a'.

	self assert: terms size = 9.
	self assert: terms distinctSize = 5.

	^terms