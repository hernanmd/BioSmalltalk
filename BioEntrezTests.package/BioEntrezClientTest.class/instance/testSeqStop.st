testing
testSeqStop

	self entrezClient: BioEntrezClient new nucest.

	self entrezClient seqStop: 1.
	self assert: ( self entrezClient valueForParameter: 'seq_stop' ) = '1'.
