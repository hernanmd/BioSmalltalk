initialize-release
initialize
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self parserForIdentifier , 
			$| asParser , 
			self databaseParser ,
			$| asParser ,
			self localIdParser