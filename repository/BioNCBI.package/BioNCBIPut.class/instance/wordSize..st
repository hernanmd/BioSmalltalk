accessing
wordSize: aSmallInteger
	" Word size "
	
	self clientUrl addParameters: 'WORD_SIZE=' , aSmallInteger asString
