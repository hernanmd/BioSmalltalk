accessing
queryTo: aSmallInteger
	" End of subsequence (one offset) "
	
	self clientUrl queryAt: 'QUERY_TO' put: aSmallInteger asString