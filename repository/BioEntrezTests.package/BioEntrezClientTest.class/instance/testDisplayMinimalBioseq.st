testing
testDisplayMinimalBioseq
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayMinimalBioseq.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '2'