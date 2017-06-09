accessing - info
setInfoCIGAR: aString
	" Set aString cigar string describing how to align an alternate allele to the reference allele "

	self info at: 'CIGAR' put: aString