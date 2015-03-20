testing
testSetTerm

	self entrezClient: BioEntrezClient new nuccore.

	self entrezClient term: 'Opuntia AND rpl16' .
	self assert: ( self entrezClient valueForParameter: 'term' ) = 'Opuntia AND rpl16'.
