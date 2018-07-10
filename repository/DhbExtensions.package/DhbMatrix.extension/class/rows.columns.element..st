*dhbExtensions
rows: nRows columns: nCols  element: fillElement
	" Answer a new matrix of nRows x nCols initialized with fillElement in all cells "

	^ (self new initializeRows: nRows columns: nCols)
		atAllPut: fillElement;
		yourself