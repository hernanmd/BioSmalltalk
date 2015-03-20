converting
asPhylip
	" Answer a <BioPhylip> instance with receiver's contents properly filled "
	
	^ BioPhylip new
		numberOfTaxa: self size;
		numberOfCharacters: self numberOfCharacters;
		sequences: self sequences;
		yourself