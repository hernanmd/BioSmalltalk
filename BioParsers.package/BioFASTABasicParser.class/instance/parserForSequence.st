accessing-parsers
parserForSequence
	" Answer a parser for parsing sequences as usually found in FASTA formatted files "

	^ (#word asParser plus flatten , #newline asParser plus optional ==> [ :nodes | (nodes copyWithout: Character cr) ]) min: 1