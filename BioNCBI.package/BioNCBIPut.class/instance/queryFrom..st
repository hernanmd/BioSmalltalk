accessing
queryFrom: aSmallInteger
	" Start of subsequence (one offset) "
	
	self clientUrl queryAt: 'QUERY_FROM' put: aSmallInteger asString