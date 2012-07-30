exporting
exportMatrix
	" Write the receiver's matrix to a file "
	
	self bioLog: 'Started writing matrix to file...'.
	self halt.
	1 to: self matrix numberOfRows do: [: rowIndex |
		self exportFirstCellColumnAt: rowIndex.
		1 to: self matrix numberOfColumns do: [: colIndex |
			self exportCellAtRow: rowIndex atColumn: colIndex ].
		self outputFile cr ].
	self halt.
	self bioLog: 'Finished writing matrix to file'.