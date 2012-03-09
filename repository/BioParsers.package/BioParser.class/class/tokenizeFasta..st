instance creation
tokenizeFasta: aString
	" Tokenize aString representing a FASTA sequence "
	
	^ ( BioFASTABasicParser on: aString ) tokenize