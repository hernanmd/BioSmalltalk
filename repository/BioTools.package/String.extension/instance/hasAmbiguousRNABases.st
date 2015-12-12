*BioTools
hasAmbiguousRNABases
	" Answer <true> if receiver contains ambiguity codes "
	
	^ (BioAlphabet guessAlphabetFrom: self) isAmbiguousAlphabet

