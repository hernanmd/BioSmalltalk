private
fillSNPMatrixSTRPositions

	rowIndex := 0.
	fCounter := 0.
	(self matrix atColumn: 1) do: [ : row | self fillSNPMatrixSTRPositions: row ].


