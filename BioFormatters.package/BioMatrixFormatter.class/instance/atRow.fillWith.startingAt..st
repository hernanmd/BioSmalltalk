populating
atRow: rowNumber fillWith: aValue startingAt: columnNumber
	" Fill the receiver's matrix with aValue at rowNumber beggining at columnNumber. 
	columnNumber must be >= 1 "

	aValue 
		fillMatrix: self matrix 
		atRow: rowNumber 
		startingAt: columnNumber
