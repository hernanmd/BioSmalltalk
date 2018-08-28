testing
testDisplayMinimalNucProt
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayMinimalNucProt.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '3'