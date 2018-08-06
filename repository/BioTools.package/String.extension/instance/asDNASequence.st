*BioTools
asDNASequence
	" Answer a new Sequence object. Defaults to BioIUPACAmbiguousDNA "
	
	^ self asSequenceForAlphabet: BioIUPACAmbiguousDNA new