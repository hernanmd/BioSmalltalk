exporting
exportCellAtRow: rowIndex atColumn: colIndex matrix: theMatrix
	" Private - Assume matrix contents at rowIndex and colIndex are not nil. "

	self outputFile nextPutAll: (theMatrix at: rowIndex at: colIndex) asString.
	self exportCellDelimiter.