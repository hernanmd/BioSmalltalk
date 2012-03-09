*BioParsers
proteinSequence
	" Answer a parser for Protein sequences, using IUPAC nomenclature "
	
	^ #proteinLetter asParser plus optional flatten
		