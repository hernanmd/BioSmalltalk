accessing - format
setFormatFT
	" Set sample genotype filter indicating if this genotype was 'called' (similar in concept to the FILTER field). Again, use PASS to indicate that all lters have been passed, a semi-colon separated list of codes for filters that fail, or `.' to indicate that filters have not been applied. These values should be described in the metainformation in the same way as FILTERs (String, no white-space or semi-colons permitted) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'FT'
