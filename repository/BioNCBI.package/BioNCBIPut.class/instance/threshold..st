accessing
threshold: aSmallIntegerString
	" Threshold for extending hits "
	
	self clientUrl addParameters: 'THRESHOLD=' , aSmallIntegerString
