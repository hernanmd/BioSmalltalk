testing
testAdd

	map add: #d -> 4.

	self assert: map checkInvariant.
	self assert: map size = 4.