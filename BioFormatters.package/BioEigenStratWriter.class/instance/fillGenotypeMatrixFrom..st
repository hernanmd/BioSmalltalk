accessing
fillGenotypeMatrixFrom: parserForPed
	| currentGenoCol |

	" counter from marker names "
	currentGenoCol := 1.
	parserForPed rowsDo: [ : row | 
		| a1 a2 index maxCols currentGenoRow |
		index := 1.		
		a1 := 1.
		a2 := 2.		
		maxCols := row size - 6.		
		currentGenoRow := 0.		
		[a1 <= maxCols and: [ a2 <= maxCols ]]
			whileTrue: [ 
				| alArray alPos |
				alPos := self alPositionsForMarker: index.				
				alArray := self genotypeArrayAt: (row allButFirst: 6) a1: a1 a2: a2.
				self fillGenotypeCellAlleles: alArray allelePosition: alPos row: currentGenoRow col: currentGenoCol.
				currentGenoRow := currentGenoRow + alPos size.
				index := index + 1.			
				a1 := a1 + 2.
				a2 := a2 + 2 ].
		currentGenoCol := currentGenoCol + 1 ].