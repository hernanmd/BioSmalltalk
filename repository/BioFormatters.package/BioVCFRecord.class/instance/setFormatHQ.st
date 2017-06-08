accessing - format
setFormatHQ
	" Set the haplotype qualities, two comma separated phred qualities (Integers) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'HQ'
