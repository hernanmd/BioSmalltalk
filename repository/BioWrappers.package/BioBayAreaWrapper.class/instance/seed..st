properties - analysis settings
seed: aNumber  
	" Set the random number generator seed "

	self propertyAt: 'seed' ifAbsentPut: [ aNumber ]