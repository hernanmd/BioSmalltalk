accessing-private
speciesDNABlockTokenizer
	" Answer a Parser for parsing the sequence blocks "
	
	^ (self speciesDNALineTokenizer , #newline asParser) star ==> [: n | n collect: #first ]