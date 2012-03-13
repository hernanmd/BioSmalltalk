testing
testDisplayMinimalBioseq

	self entrezClient: BioEntrezClient new nucest.

	self entrezClient displayMinimalBioseq.
	self assert: ( self entrezClient valueForParameter: 'complexity' ) = '2'.
