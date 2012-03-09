accessing-parsers
parserForExactly: aCollection
	" Answer a parser for parsing exactly aCollection "

	^ aCollection asParser negate plus , aCollection asParser.