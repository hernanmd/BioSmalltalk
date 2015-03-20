accessing
newGenotypeMatrix: parserForPed
	" Answer a new matrix initialized from parserForPed settings.
	Matrix is initialized with all 0's. "
	
	| numberOfColumns |

	numberOfColumns := parserForPed numRows // 2.	
	^ self matrixClass 
			rows: self matrix numberOfRows 
			columns: numberOfColumns 
			element: 0.