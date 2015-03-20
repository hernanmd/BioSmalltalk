accessing-parsers
parseWithoutSeparators
	
	ambParser := self parserForAmbiguity.
	parser := self parserForAmbiguousBase.	
	^ self parse