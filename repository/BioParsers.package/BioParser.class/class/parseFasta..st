instance creation
parseFasta: aFastaString
	" Parse aFastaString and answer a single fasta instance "
	
	^ ( BioFASTABasicParser on: aFastaString ) parse