accessing-parsers
tokenizeWithSeparators
	
	ambParser := self parserForAmbiguityDelimited.
	parser := self parserForAmbiguousBase.	
	^ self tokenize