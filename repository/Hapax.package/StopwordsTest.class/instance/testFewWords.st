running
testFewWords

	sw := Stopwords fromString: 'and the super of a'.

	self assert: sw size = 5.

	^sw