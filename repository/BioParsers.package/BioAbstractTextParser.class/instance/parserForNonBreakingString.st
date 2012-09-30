accessing-parsers
parserForNonBreakingString
	
	^ (self parserForPredicateWith: (Array with: Character cr with: Character lf)) plus flatten		
