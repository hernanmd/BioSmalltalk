testing
testSetGb

	self entrezClient: BioEntrezClient new nuccore.

	self entrezClient setGb.
	self assert: ( self entrezClient valueForParameter: 'rettype' ) = 'gb'.
