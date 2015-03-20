testing
testForDataTypeRNA

	self formatter: self formatterClass forDataTypeRNA.
	
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType = 'RNA'.