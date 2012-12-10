testing
testAtKey

	self assert: (map atKey: #b) = 2.
	self should: (map atKey: 2) = nil.