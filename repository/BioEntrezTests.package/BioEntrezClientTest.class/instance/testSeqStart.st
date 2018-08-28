testing
testSeqStart
	self entrezClient: BioEntrezClient new nucest.
	self entrezClient seqStart: 1.
	self
		assert: (self entrezClient valueForParameter: 'seq_start')
		equals: '1'