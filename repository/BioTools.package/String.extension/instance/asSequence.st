*BioTools
asSequence
	" Answer a new Sequence object guessing the Alphabet, see #guessAlphabetFrom: "
	
	^ BioSequence newWith: self asCondensedString