testing
testIncludes


	self assert: (map includes: 2).
	self assert: (map includes: #b) not.
	self assert: (map includes: 4) not.