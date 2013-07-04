accessing
fillGenotypeMatrix
	" self needsWork "
	| genoMatrix numberOfColumns a1 a2 maxCols parserForPed |

	parserForPed := self setParserForPed.
	numberOfColumns := parserForPed  numRows.	
	genoMatrix := self matrixClass rows: self matrix numberOfRows columns: numberOfColumns.
	" count from marker names "
	maxCols := numberOfColumns - 5.
	a1 := 1.
	a2 := 2.
	parserForPed rowsDo: [ : row | 
		[a1 <= maxCols and: [ a2 <= maxCols ]]
			whileTrue: [ 
				| rowIdx colIdx genoValue |
				genoValue := self genotypeValue: row a1: a1 a2: a2.
				genoMatrix at: 1 at: 1 put: genoValue.
				a1 := a1 + 2.
				a2 := a2 + 2 ] ].