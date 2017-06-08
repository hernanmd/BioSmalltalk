accessing - format
setFormatPL
	" Set the phred-scaled genotype likelihoods rounded to the closest integer (and otherwise defined precisely as
the GL field) (Integers) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'PL'
