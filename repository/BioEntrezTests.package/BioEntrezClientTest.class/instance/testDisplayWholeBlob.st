testing
testDisplayWholeBlob

	self entrezClient: BioEntrezClient new nucest.

	self entrezClient displayWholeBlob.
	self assert: ( self entrezClient valueForParameter: 'complexity' ) = '0'.
