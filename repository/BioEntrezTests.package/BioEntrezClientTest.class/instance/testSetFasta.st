testing
testSetFasta
	self entrezClient: BioEntrezClient new nuccore.
	self entrezClient setFasta.
	self
		assert: (self entrezClient valueForParameter: 'rettype')
		equals: 'fasta'