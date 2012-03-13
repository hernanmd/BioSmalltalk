testing
testSetGss

	self entrezClient: BioEntrezClient new nucgss.

	self entrezClient setGss.
	self assert: ( self entrezClient valueForParameter: 'rettype' ) = 'gss'.
