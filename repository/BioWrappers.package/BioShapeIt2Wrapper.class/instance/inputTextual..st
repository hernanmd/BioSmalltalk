properties - input
inputTextual: inputFilename 
	" Set ped, map input all at once to be fileName "

	self propertyAt: 'P' ifAbsentPut: [ inputFilename  ]