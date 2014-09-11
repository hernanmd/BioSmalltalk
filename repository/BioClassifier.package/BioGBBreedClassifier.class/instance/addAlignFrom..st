accessing
addAlignFrom: gbSeqRecord
	" Private - If we have a reader with aligments then add the alignment for gbSeqRecord "

	self reader notNil
		ifTrue: [ 
			| acc |
			acc := gbSeqRecord at: 'GBSeq_accession-version'.
			self organization
				alignmentAt: acc 
				put: (self alignments atAccession: acc) asString ]