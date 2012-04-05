accessing
iThresh: aFloatString
	" Threshold for extending hits (PSI BLAST only) "
	
	self clientUrl addParameters: 'I_THRESH=' , aFloatString