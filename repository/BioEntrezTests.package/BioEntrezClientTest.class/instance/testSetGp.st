testing
testSetGp
	self entrezClient: BioEntrezClient new protein.
	self entrezClient setGp.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'gp'.
	self entrezClient setGpc.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'gpc'