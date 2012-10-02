accessing-private
tokenizeDna
	" Answer a parser for parsing exactly aCollection "

	parser := self firstLineTokenizer , #newline asParser , self speciesDNABlockTokenizer.
	^ self parse.
	
	