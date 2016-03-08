testing
testAddLocation

	self deny: (self population includesLocation: 'USA').
	self population addLocation: 'USA'.
	self assert: (self population includesLocation: 'USA').
