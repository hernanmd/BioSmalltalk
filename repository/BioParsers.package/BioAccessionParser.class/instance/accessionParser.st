accessing
accessionParser
	" Answer a parser for parsing accession identifiers "

	| discardCharacters |
	
	discardCharacters := ( 
		( 'gb|' asParser / 'emb|' asParser / 'dbj|' asParser / 'ref|' asParser / 'sp|' asParser ) /
		( 'gb|' asParser negate plus , 'gb|' asParser) / 
		( 'emb|' asParser negate plus , 'emb|' asParser ) /
		( 'dbj|' asParser negate plus , 'dbj|' asParser ) /
		( 'ref|' asParser negate plus , 'ref|' asParser ) /
		( 'sp|' asParser negate plus , 'sp|' asParser )
		) optional answer: nil.

	^ discardCharacters , self parserForAccession

