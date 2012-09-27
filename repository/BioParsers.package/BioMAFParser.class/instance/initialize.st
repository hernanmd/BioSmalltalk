initialize-release
initialize

	| options |
	
	super initialize.	
	parser := '##maf ' asParser.
	options := 
		self parserForNonBreakingString , 
			$= asParser , 
			self parserForNonBreakingString ==> [: n | ].

"	( 'version=' asParser / 'scoring=' asParser / 'program=' asParser )"