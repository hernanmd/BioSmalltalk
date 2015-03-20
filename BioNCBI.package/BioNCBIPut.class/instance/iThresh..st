accessing
iThresh: aFloat
	" Threshold for extending hits (PSI BLAST only) "
	
	self clientUrl queryAt: 'I_THRESH' put: aFloat asString