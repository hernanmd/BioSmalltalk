properties - input/output
printFrequency: aNumber  
	" Set the print frequency to the screen "

	self propertyAt: 'printFrequency' ifAbsentPut: [ aNumber ]