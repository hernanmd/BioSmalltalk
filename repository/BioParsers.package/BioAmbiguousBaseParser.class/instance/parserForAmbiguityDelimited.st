accessing-parsers
parserForAmbiguityDelimited
	" Answer a parser for parsing a sequence variation of the type [A/C] or [C/T], etc.  "

	| open close separator letter |
	
	open := $[ asParser.
	close := $] asParser.
	separator := self delimiter asParser.
	letter := #dnaLetter asParser.

	^ ( open , letter , separator , letter , close ) ==> [: ambTokens | self convertAmbiguousToSingleBase: ambTokens ]