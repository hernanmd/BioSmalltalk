properties
bfile: fileName  
	" Set the input binary file to fileName, without extension "

	self 
		propertyAt: 'bfile' 
		ifAbsentPut: [ self buildPath: fileName ]