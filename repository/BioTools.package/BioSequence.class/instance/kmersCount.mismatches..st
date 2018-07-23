accessing
kmersCount: patString mismatches: d
	" Answer the number of times that k-mers patString appears as substring of the receiver allowing d mismatches "
	
	^ (self sequence indicesOfSubstring: patString mismatches: d) size