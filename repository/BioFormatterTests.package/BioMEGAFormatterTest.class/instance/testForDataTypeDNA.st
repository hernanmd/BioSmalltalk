testing
testForDataTypeDNA
	self formatter: self formatterClass forDataTypeDNA.
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType equals: 'DNA'