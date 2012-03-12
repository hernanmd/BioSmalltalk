populating
atColumn: aColumnNumber fillWith: aValue startingAt: rowNumber
	" Fill the receiver's matrix with aValue at aColumnNumber 
	beggining at rowNumber. rowNumber must be >= 1 "

	aValue 
		fillMatrix: self matrix 
		atColumn: aColumnNumber 
		startingAt: rowNumber
