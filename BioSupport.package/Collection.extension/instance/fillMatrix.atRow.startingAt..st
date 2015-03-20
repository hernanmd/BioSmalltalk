*BioSupport
fillMatrix: aMatrix atRow: rowNumber startingAt: startColumnNumber
	" Fill aMatrix with the receiver at aColumnNumber beggining at rowNumber. "
	
	aMatrix 
		atRow: rowNumber 
		put: self 
		startingAt: startColumnNumber