accessing-parsers
parserForNonBreakingString
	
	^ ( self parserForPredicateWith: { Character cr . Character lf } ) 
				plus flatten		
