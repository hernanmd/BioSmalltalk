accessing-parsers
parserForNonFastaString
	" Answer a parser for parsing any kind of description text in a FASTA sequence "

	^ self parserForPredicateWith: self specialFastaChars