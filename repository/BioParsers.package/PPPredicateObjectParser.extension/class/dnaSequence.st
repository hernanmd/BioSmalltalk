*BioParsers
dnaSequence
	" Answer a parser for a DNA sequence, using unambiguous IUPAC nomenclature "
	
	^ self dnaLetter plus flatten end
		