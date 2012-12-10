running
testRemoveStopwords

	| deer |
	deer := self testDeer90.

	self assert: (deer terms includes: 'the').

	deer removeStopwords.

	self assert: (deer terms includes: 'the') not.
	self assert: deer documents size = 9.
	self assert: deer terms distinctSize = 34.

	^deer