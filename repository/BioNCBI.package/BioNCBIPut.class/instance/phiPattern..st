accessing
phiPattern: aString
	" Phi Blast pattern "
	
	self clientUrl addParameters: 'PHI_PATTERN=' , aString
