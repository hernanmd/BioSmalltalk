testing
testDisplayMinimalPubSet
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayMinimalPubSet.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '4'