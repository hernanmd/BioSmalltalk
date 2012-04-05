accessing
queryFrom: aSmallIntegerString
	" Start of subsequence (one offset) "
	
	self clientUrl addParameters: 'QUERY_FROM=' , aSmallIntegerString