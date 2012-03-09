accessing-parsers
parserForAmbiguousBase
	" Answer a parser for parsing degenerate base symbols "

	| dnaSeq |
	
	dnaSeq := #dnaSequence asParser.
	^ ( dnaSeq / self ambParser ) plus 	==> [: nodes | 
			( nodes joinUsing: Array empty ) joinUsing: String empty ]