properties
bcf: fileName  
	" Set the input to a (possibly gzipped) BCF2 fileName "

	self propertyAt: 'bcf' ifAbsentPut: [ fileName ]