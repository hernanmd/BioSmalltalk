exporting
exportMatrix
	" Write the receiver's matrix to a file "
	
	self bioLog: 'Started writing matrix to file...'.
	1 to: self matrix numberOfRows do: [: rowIndex |
		self exportFirstCellColumnAt: rowIndex.
		1 to: self matrix numberOfColumns do: [: colIndex |
			self exportCellAtRow: rowIndex atColumn: colIndex ].
		self outputFile cr ].
	self outputFile close.
	self bioLog: 'Finished writing matrix to file'.