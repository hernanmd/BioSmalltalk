testing
testAtValue

	self assert: (map atValue: #b) = nil.
	self should: (map atValue: 2) = #b.