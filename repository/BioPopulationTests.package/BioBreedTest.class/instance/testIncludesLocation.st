testing
testIncludesLocation

	self deny: (self population includesLocation: 'Nicaragua').
	self population addLocation: 'Nicaragua'.
	self assert: (self population includesLocation: 'Nicaragua').	
