initialize-release
initialize

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asParser , 
			self entry , 
			$| asParser ,
			self chain