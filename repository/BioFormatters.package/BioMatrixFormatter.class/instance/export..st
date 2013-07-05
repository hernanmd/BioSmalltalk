exporting
export: theMatrix

	1 to: theMatrix numberOfRows do: [: rowIndex |
		self exportFirstCellColumnAt: rowIndex.
		1 to: theMatrix numberOfColumns do: [: colIndex |
			self exportCellAtRow: rowIndex atColumn: colIndex matrix: theMatrix ].
		self outputFile cr ].
	self outputFile close.