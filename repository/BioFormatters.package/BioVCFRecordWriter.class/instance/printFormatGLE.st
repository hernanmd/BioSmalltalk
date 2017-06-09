accessing - format
printFormatGLE
	" Set genotype likelihoods of heterogeneous ploidy, used in presence of uncertain copy number. For example:
GLE=0:-75.22,1:-223.42,0/0:-323.03,1/0:-99.29,1/1:-802.53 (String) "

	self appendFormatDelimiter.
	self formatStream nextPutAll: 'GLE'