accessing - format
printFormatEC
	" Set the comma separated list of expected alternate allele counts for each alternate allele in the same order as listed in the ALT field (typically used in association analyses) (Integers) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'EC'
