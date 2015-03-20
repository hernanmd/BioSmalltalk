testing
testSetEst

	self entrezClient: BioEntrezClient new nucest.

	self entrezClient setEst.
	self assert: ( self entrezClient valueForParameter: 'rettype' ) = 'est'.
