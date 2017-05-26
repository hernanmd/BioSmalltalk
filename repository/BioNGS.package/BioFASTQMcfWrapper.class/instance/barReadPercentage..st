properties
barReadPercentage: aFloat
	" 'N' (Bad read) percentage causing cycle removal (20) "

	self propertyAt: 'x' ifAbsentPut: [ aFloat ]