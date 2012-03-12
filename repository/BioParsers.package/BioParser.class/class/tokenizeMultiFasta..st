parse-fasta
tokenizeMultiFasta: aString
	" Tokenize aString representing a MultiFASTA sequence "
	
	^ ( BioFASTABasicParser on: aString ) tokenize