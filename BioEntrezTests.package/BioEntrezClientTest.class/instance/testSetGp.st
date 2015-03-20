testing
testSetGp

	self entrezClient: BioEntrezClient new protein.

	self entrezClient setGp.
	self assert: ( self entrezClient valueForParameter: 'rettype' ) = 'gp'.

	self entrezClient setGpc.
	self assert: ( self entrezClient valueForParameter: 'rettype' ) = 'gpc'.