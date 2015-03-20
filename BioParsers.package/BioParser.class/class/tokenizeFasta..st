parse-fasta
tokenizeFasta: aString
	" Tokenize aString representing a FASTA sequence "
	
	^ ( BioFASTABasicParser on: aString ) tokenize first