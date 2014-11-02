accessing
lowerCaseMaskOff
	" Enable masking of lower case in query "
	
	self clientUrl queryAt: 'LCASE_MASK' put: 'no'