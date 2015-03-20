*BioParsers
proteinSequence
	" Answer a parser for Protein sequences, using IUPAC nomenclature "
	
	^ self proteinLetter plus flatten end
		