accessing-parsers
parserForAmbiguity
	" Answer a parser for parsing a sequence variation of the type [AC] or [CT], etc.  "

	| open close letters |
	
	open := $[ asParser.
	close := $] asParser.
	letters := #dnaLetter asParser min: 2.

	^ ( open , letters , close ) ==> [: ambTokens | self convertAmbiguousToSingleBase: ambTokens ]