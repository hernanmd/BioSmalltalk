properties
inputMap: inputMapFilename 
	" Set input MAP file to be inputMapFilename "

	self propertyAt: 'M' ifAbsentPut: [ inputMapFilename ]