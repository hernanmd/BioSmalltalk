*BioTools
asRNASequence
	" Answer a new protein sequence object. Alphabet defaults to BioIUPACAmbiguousRNA "
	
	^ self asSequenceForAlphabet: BioIUPACAmbiguousRNA new