*BioParsers
dnaLetter
	" Answer a parser for a DNA letter, using unambiguous IUPAC nomenclature "
	
	^ self anyOf: 
		BioIUPACUnambiguousDNA codes asUppercase , 
		BioIUPACUnambiguousDNA codes asLowercase
		