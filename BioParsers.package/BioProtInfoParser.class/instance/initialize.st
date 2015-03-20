initialize-release
initialize

	super initialize.	
	parser := 
		self parserForIdentifier ==> [: r | r allButLast ] , 
		self entryParser.