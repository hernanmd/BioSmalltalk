accessing
commProbesFrom: csvFilename1 to: csvFilename2
	" 
	Compare two sorted affy CSV files exported from #sortByColumnsAt: line by line
	Does not check order (assume already sorted CSV files) "
	
	| affyChip1 affyChip2 commonProbes |
	affyChip1 := self readProbesFrom: csvFilename1.
	affyChip2 := self readProbesFrom: csvFilename2.
	self dumpAffyProbes: (affyChip1 intersection: affyChip2) asSortedCollection.
	self resetOutput.
	self dumpAffyProbes: (affyChip2 intersection: affyChip1) asSortedCollection.
