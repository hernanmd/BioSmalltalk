*BioSupport
fillMatrix: aMatrix atColumn: aColumnNumber startingAt: rowNumber
	" Fill aMatrix with the receiver at aColumnNumber beggining at rowNumber. "
	
	aMatrix atColumn: aColumnNumber put: self startingAt: rowNumber