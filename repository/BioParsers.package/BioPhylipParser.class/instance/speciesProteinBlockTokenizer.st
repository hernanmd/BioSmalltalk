accessing-private
speciesProteinBlockTokenizer
	" Answer a Parser for parsing the sequence blocks "
	
	^ (self speciesProteinLineTokenizer , #newline asParser) star ==> [: n | n collect: #first ]