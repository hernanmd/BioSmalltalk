accessing-private
speciesDNANamedBlockTokenizer
	" Answer a Parser for parsing the sequence blocks "
	
	^ (self speciesDNALineTokenizer , (#newline asParser answer: nil)) star