properties
minLength: aNumber 
	" Set The minimum length of local alignment (default: 100) to be aNumber "

	self propertyAt: 'C' ifAbsentPut: [ aNumber ]