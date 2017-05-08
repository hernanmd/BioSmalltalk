properties - analysis settings
probBurnIn: aNumber  
	" Set the First MCMC cycle sampling point for .area probs.txt and .nhx (Note: For these files to be reflective of the posterior, the chain mustfirst burn-in { i.e. a small probBurnIn will give inaccurate results.) "

	self propertyAt: 'probBurnIn' ifAbsentPut: [ aNumber ]