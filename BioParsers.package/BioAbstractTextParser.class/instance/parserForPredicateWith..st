accessing-parsers
parserForPredicateWith: aCollection
	" Answer a parser for parsing any kind of description text in a FASTA sequence "

	^ PPPredicateObjectParser anyExceptAnyOf: aCollection