accessing-private
speciesProteinNamedBlockTokenizer
	" Answer a Parser for parsing the sequence blocks "
	
	^ (self speciesProteinLineTokenizer , (#newline asParser answer: nil)) star