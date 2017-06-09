accessing - info
printInfoAN: aNumber
	" Set aNumber of total number of alleles in called genotypes "

	self appendInfoDelimiter.
	self infoStream 
		nextPutAll: 'AN=';
		nextPutAll: aNumber asString 