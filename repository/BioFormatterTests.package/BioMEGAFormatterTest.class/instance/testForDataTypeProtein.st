testing
testForDataTypeProtein

	self formatter: self formatterClass forDataTypeProtein.
	
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType = 'Protein'.