*BioTools
hasAmbiguousRNABases
	" Answer <true> if receiver contains ambiguity codes "
	
	| alpha |
	
	alpha := BioAlphabet guessAlphabetFrom: self.
	^ alpha asUppercase anySatisfy: [: letter | ('ACGU' includes: letter) not ]
