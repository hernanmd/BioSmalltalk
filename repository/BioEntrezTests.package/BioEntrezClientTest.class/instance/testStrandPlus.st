testing
testStrandPlus
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient strandPlus.
	self
		assert: (self entrezClient valueForParameter: 'strand')
		equals: '1'