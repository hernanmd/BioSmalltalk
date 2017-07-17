properties
input: fileName  
	" Set the input file to fileName "

	self propertyAt: '' ifAbsentPut: [ fileName ]