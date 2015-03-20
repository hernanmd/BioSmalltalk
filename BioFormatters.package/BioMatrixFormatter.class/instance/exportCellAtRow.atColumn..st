exporting
exportCellAtRow: rowIndex atColumn: colIndex
	" Private - Assume matrix contents at rowIndex and colIndex are not nil. "

	self outputFile nextPutAll: (matrix at: rowIndex at: colIndex) asString.
	self exportCellDelimiter.