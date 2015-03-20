*BioParsers
number
	" Answer a parser for parsing any sequence of digits "
	
	^ #digit asParser plus flatten
