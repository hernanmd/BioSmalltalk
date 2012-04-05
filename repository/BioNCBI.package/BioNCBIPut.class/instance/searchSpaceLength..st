accessing
searchSpaceLength: aSmallIntegerString
	" Effective length of the search space "
	
	self clientUrl addParameters: 'SEARCHSP_EFF=' , aSmallIntegerString