populating
fillFrequenciesColumn
	" Fill the receiver's matrix with the frequencies at last column. If frequencies
	were not provided, then fill the frequencies column with 1's "
	
	self 
		atColumn: self matrix numberOfColumns 
		fillWith: self frequencies
		startingAt: self positionCiphers + 1
	