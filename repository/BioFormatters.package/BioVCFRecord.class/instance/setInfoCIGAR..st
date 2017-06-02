accessing - info
setInfoCIGAR: aString
	" Set aString cigar string describing how to align an alternate allele to the reference allele "

	self hasInfoFields
		ifTrue: [ self info nextPut: $; ].
	self info 
		nextPutAll: 'CIGAR=';
		nextPutAll: aString