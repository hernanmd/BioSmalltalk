accessing
matrixName: aString
	" Matrix name (protein search only) "
	
	self clientUrl queryAt: 'MATRIX_NAME' put: aString