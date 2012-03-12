accessing
initMatrixRows: rowsNumber columns: columnsNumber
	" Private - Initialize the receiver's matrix with rowsNumber and columnsNumber "
	
	self matrix: ( self matrixClass rows: rowsNumber columns: columnsNumber )