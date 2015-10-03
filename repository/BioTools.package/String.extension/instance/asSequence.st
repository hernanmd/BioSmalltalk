*BioTools
asSequence
	" Answer a new Sequence object guessing the Alphabet. See #guessAlphabetFrom: for details "
	
	^ BioSequence newWith: self asCondensedString