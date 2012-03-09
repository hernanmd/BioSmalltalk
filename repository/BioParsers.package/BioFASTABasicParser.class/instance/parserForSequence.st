accessing-parsers
parserForSequence
	" Answer a parser for parsing sequences as usually found in FASTA formatted files "

	^ ( ( #dnaLetter asParser plus flatten / #proteinLetter asParser plus flatten ) , 
		#newline asParser plus optional ) min: 1