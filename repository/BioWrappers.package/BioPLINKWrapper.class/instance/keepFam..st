properties
keepFam: fileName  
	" Set the family to keep to fileName "

	self propertyAt: 'keep-fam' ifAbsentPut: [ fileName ]