accessing
phiPattern: aString
	" Phi Blast pattern "
	
	self clientUrl queryAt: 'PHI_PATTERN' put: aString
