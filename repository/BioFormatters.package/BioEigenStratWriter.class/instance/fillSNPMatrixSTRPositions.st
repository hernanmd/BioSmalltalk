private
fillSNPMatrixSTRPositions

	rowIndex := 0.
	gPosCounter := 1.
	fCounter := 0.
	(self matrix atColumn: 1) do: [ : row | self fillSNPMatrixSTRPositions: row ].


