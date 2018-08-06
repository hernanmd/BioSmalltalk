*BioTools
asProteinSequence
	" Answer a new protein sequence object. Alphabet defaults to BioIUPACProteinExtended "
	
	^ self asSequenceForAlphabet: BioIUPACProteinExtended new