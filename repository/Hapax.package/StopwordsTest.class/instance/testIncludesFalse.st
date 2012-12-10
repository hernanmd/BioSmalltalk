running
testIncludesFalse

	sw := Stopwords fromString: 'and the super of a'.

	self assert: (sw includes: 'A') not.
	self assert: (sw includes: 'offer') not.
	self assert: (sw includes: '') not.
	self assert: (sw includes: 'object') not.
	self assert: (sw includes: nil) not.

	^sw