*BioParsers
dnaSequence
	" Answer a parser for a DNA sequence, using unambiguous IUPAC nomenclature "
	
	^ #dnaLetter asParser plus flatten
		