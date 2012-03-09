accessing-parsers
parserForIdentifier
	" Answer a parser for parsing an identifier in a FASTA entry "

	" Get rid of the last | character "
	^ self identifier asParser ==> [: r | r allButLast ]