accessing
matrixName: aString
	" Matrix name (protein search only) "
	
	self clientUrl addParameters: 'MATRIX_NAME=' , aString