running
testDeer90

	| deer |
	deer := Corpus deer90.
	
	self assert: deer documents size = 9.
	self assert: deer terms distinctSize = 42.

	^deer