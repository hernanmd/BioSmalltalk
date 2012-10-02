accessing-private
tokenizeProtein
	" Answer a parser for parsing exactly aCollection "

	parser := self firstLineTokenizer , #newline asParser , self speciesProteinBlockTokenizer.
	^ self parse.
	