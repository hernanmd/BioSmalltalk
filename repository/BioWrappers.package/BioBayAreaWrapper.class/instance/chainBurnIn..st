properties - analysis settings
chainBurnIn: aNumber  
	" Set the first MCMC cycle sampling point for .parameters.txt and .area states.txt "

	self propertyAt: 'chainBurnIn' ifAbsentPut: [ aNumber ]