accessing
addAlignFrom: gbSeqRecord

	| acc |
	
	acc := gbSeqRecord at: 'GBSeq_accession-version'.
	self organization
		alignmentAt: acc 
		put: ( self alignments atAccession: acc ) asString