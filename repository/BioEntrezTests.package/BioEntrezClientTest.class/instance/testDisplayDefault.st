testing
testDisplayDefault
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient displayDefault.
	self
		assert: (self entrezClient valueForParameter: 'complexity')
		equals: '0'