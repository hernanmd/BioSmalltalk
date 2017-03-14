properties
bfile: fileName  
	" Set the input binary file to fileName "

	self propertyAt: 'bfile' ifAbsentPut: [ fileName ]