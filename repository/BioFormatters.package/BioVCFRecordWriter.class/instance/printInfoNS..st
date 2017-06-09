accessing - info
printInfoNS: aNumber
	" Set aNumber of samples with data"

	self appendInfoDelimiter.
	self infoStream
		nextPutAll: 'NS=';
		nextPutAll: aNumber asString 