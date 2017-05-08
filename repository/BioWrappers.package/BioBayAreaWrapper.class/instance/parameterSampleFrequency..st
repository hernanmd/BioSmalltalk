properties - input/output
parameterSampleFrequency: aNumber  
	" Set the MCMC sample frequency to populate the .parameters.txt file "

	self propertyAt: 'parameterSampleFrequency' ifAbsentPut: [ aNumber ]