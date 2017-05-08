properties - analysis settings
chainLength: aNumber  
	" Set the number of MCMC cycles "

	self propertyAt: 'chainLength' ifAbsentPut: [ aNumber ]