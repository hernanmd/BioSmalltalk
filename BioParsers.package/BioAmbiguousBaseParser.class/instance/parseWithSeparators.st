accessing-parsers
parseWithSeparators
	
	ambParser := self parserForAmbiguityDelimited.
	parser := self parserForAmbiguousBase.	
	^ self parse