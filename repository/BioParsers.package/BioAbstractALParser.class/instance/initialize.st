initialize-release
initialize

	super initialize.
	parser := 
		self parserForIdentifier , 
		self parserForAccession , 
		self parserForLocus optional