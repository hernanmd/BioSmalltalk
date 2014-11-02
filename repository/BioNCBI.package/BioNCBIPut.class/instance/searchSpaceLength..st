accessing
searchSpaceLength: aSmallInteger
	" Effective length of the search space "
	
	self clientUrl queryAt: 'SEARCHSP_EFF' put: aSmallInteger asString