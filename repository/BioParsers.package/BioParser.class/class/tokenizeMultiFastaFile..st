parse-fasta
tokenizeMultiFastaFile: aFastaFullFileLocation
	" Tokenize aString representing a MultiFASTA sequence "
	
	^ (BioFASTABasicParser on: (self openFullFileNamed: aFastaFullFileLocation) contents) tokenize