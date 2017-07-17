properties
out: fileName  
	" Set the output file to fileName "

	self propertyAt: 'o' ifAbsentPut: [ fileName ]