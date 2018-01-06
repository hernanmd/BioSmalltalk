properties
file: fileName  
	" Set the input file to fileName "

	self propertyAt: 'file' ifAbsentPut: [ self buildPath: fileName ]