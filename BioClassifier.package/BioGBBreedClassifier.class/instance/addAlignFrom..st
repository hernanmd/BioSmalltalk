accessing
addAlignFrom: gbSeqRecord
	" Private - If we have a reader with aligments then add the alignment for gbSeqRecord "

	| acc |
	
	self flag: #ArlequinExport.
	acc := gbSeqRecord at: BioGBSeqCollection qualifierForAccessionWithVersion.
	self organization
		alignmentAt: acc 
		put: (self alignments atAccession: acc) asString