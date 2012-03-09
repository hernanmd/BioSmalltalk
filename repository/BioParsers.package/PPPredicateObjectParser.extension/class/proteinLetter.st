*BioParsers
proteinLetter
	" Answer a parser for a protein letter, using extended IUPAC nomenclature "
	
	^ self anyOf: 
		BioIUPACProteinExtended codes asUppercase , 
		BioIUPACProteinExtended codes asLowercase