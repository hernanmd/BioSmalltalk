testing
testIncludesKey


	self assert: (map includesKey: #b).
	self assert: (map includesKey: 2) not.
	self assert: (map includesKey: #d) not.