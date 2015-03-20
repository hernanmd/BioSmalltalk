accessing
alignments: aSmallInteger
	" Number of alignments "
	
	self clientUrl queryAt: 'ALIGNMENTS' put: aSmallInteger asString