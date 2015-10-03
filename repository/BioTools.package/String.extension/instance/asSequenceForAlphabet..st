*BioTools
asSequenceForAlphabet: anAlphabet
	" Answer a new Sequence object using anAlphabet. If anAlphabet is null then guess an alphanet using the receiver, see #guessAlphabetFrom: "
	
	^ BioSequence 
		newWith: self asCondensedString
		alphabet: anAlphabet