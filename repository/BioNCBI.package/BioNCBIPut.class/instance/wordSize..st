accessing
wordSize: aSmallInteger
	" Word size "
	
	self clientUrl queryAt: 'WORD_SIZE' put: aSmallInteger asString
