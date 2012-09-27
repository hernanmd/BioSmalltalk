initialize-release
initialize
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self giParser , 
		self parserForDbAccessionLocus