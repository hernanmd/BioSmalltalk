testing
testStrandMinus
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient strandMinus.
	self
		assert: (self entrezClient valueForParameter: 'strand')
		equals: '2'