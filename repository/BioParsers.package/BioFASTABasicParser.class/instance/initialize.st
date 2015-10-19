initialize-release
initialize
	" Private - See superimplementor's comment "

	super initialize.
	parser := ( 
		self parserForNonBreakingString , 
		#newline asParser ,
		self parserForSequence ) plus end 
		
