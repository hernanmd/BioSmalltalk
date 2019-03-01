accessing
intersect: csvFilename1 with: csvFilename2 prefixes: prefixAssoc
	" 
	Compare two sorted affy CSV files exported from #sortByColumnsAt: line by line
	Does not check order (assume already sorted CSV files) "
	
	| affyChip1 affyChip2 |
	affyChip1 := self readReducedProbesFrom: csvFilename1.
	affyChip2 := self readReducedProbesFrom: csvFilename2.
	self fileNamePrefix: prefixAssoc key.
	self dumpAffyProbes: (affyChip1 intersection: affyChip2) asSortedCollection.
	self resetOutput.
	self fileNamePrefix: prefixAssoc value.
	self dumpAffyProbes: (affyChip2 intersection: affyChip1) asSortedCollection.
