testing
testForDataTypeNucleotide

	self formatter: self formatterClass forDataTypeNucleotide.
	
	self assert: (self formatter isKindOf: BioMEGAFormatter).
	self assert: self formatter formatType = 'Nucleotide'.