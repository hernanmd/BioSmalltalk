properties - input/output
historySampleFrequency: aNumber  
	" Set the MCMC sample frequency to populate the .area states.txt, .area probs.txt, and .nhxfiles "

	self propertyAt: 'historySampleFrequency' ifAbsentPut: [ aNumber ]