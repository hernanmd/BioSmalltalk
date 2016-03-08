testing
testLocations

	self assert: self population locations isEmpty.
	self assert: (self population locations isKindOf: Collection).
