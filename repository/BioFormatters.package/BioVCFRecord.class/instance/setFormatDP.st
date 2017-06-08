accessing - format
setFormatDP
	" Set read depth at this position for this sample (Integer) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'DP'
