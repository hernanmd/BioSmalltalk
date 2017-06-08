accessing - format
setFormatMQ
	" Set the RMS mapping quality, similar to the version in the INFO field. (Integer) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'MQ'
