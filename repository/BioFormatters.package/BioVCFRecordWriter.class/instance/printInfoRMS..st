accessing - info
printInfoRMS: aNumber
	" Set aNumber of RMS mapping quality "

	self appendInfoDelimiter.
	self infoStream
		nextPutAll: 'RMS=';
		nextPutAll: aNumber asString 