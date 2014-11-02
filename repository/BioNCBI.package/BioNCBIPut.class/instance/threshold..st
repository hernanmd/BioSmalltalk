accessing
threshold: aSmallInteger
	" Threshold for extending hits "
	
	self clientUrl queryAt: 'THRESHOLD' put: aSmallInteger asString
