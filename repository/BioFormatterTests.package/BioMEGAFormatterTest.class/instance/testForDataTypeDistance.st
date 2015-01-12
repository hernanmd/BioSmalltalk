testing
testForDataTypeDistance

	self formatter: self formatterClass forDataTypeDistance.
	
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType = 'Distance'.