testing
testAtPutIllegal

	self assert: map size = 3.
	self assert: (map atValue: 2) = #b.

	self should: [ map at: #z put: 2 ] raise: Error.

	self assert: map size = 3.
	self assert: (map atValue: 2) = #b.