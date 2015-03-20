accessing-parsers
parserForAmbiguousBase
	" Answer a parser for parsing degenerate base symbols "

	| dnaSeq |
	
	dnaSeq := #dnaLetter asParser plus flatten.
	^ (dnaSeq / self ambParser) plus ==> [ : nodes | (nodes joinUsing: Array empty) joinUsing: String empty ]