initialize-release
initialize
	" Private - See superimplementor's comment "

	super initialize.
	parser := 
		self parserForIdentifier , 
		self parserForAccession ,
		( self parserForEntry ==> [: r | r allButFirst ] ).