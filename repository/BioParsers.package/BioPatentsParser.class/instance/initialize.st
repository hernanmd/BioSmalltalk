initialize-release
initialize

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asParser , 
			self countryParser , 
			$| asParser , 
			self parserForNumber.