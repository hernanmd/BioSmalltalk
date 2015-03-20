initialize-release
initialize
	" Private - See superimplementor's comment "
	
	super initialize.
	parser := 
		self parserForIdentifier , 
		self parserForAccession ,
		( self parserForLocus ==> [: r | r allButFirst anyOne ] ).