accessing
fillGenotypeMatrix
	" self needsWork "
	| genoMatrix numberOfColumns maxCols parserForPed currentGenoCol currentGenoRow |

	parserForPed := self setParserForPed.
	numberOfColumns := parserForPed  numRows.	
	genoMatrix := self matrixClass rows: self matrix numberOfRows columns: numberOfColumns element: 0.
	" count from marker names "
	currentGenoCol := 1.
	parserForPed rowsDo: [ : row | 
		| a1 a2 index |
		index := 1.		
		a1 := 1.
		a2 := 2.		
		maxCols := row size - 6.		
		currentGenoRow := 0.		
		[a1 <= maxCols and: [ a2 <= maxCols ]]
			whileTrue: [ 
				| alArray genoValue alPos |
				alPos := self alPositionsForMarker: index.				
				alArray := self genotypeArrayAt: (row allButFirst: 6) a1: a1 a2: a2.
				alArray do: [ : a | | colPos |
					genoValue := self genotypeValueAt: alArray.
					(a = '0' and: [ currentGenoRow = 0 ]) 
						ifTrue: [ colPos := currentGenoRow + 1 ]
						ifFalse: [ colPos := (currentGenoRow + (alPos indexOf: a)) ].
					genoMatrix at: colPos at: currentGenoCol put: genoValue ].
				currentGenoRow := currentGenoRow + alPos size.
				index := index + 1.			
				a1 := a1 + 2.
				a2 := a2 + 2 ].
		currentGenoCol := currentGenoCol + 1 ].
	^ genoMatrix