properties - analysis settings
areaProposalTuner: aFloat  
	" Set the the number of areas sampled for a history update is Poisson-distributed with rate equal to this value multiplied by the number of areas in the analysis.
The value must be between 0 and 1. Adjust this value if you find your MCMC mixes slowly. "

	self propertyAt: 'areaProposalTuner' ifAbsentPut: [ aFloat ]