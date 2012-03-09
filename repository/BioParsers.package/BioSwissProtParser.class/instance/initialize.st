initialize-release
initialize
	" Private - See superimplementor's comment "
	
	parser := self parserForIdentifier , 
				self parserForAccession ,
				( self parserForEntry ==> [: r | r allButFirst ] ).