accessing-parsers
tokenizeWithoutSeparators
	
	ambParser := self parserForAmbiguity.
	parser := self parserForAmbiguousBase.	
	^ self tokenize