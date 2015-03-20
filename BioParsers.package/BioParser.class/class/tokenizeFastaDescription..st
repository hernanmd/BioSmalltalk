parse-fasta
tokenizeFastaDescription: aString
	" Tokenize aString representing a FASTA header String "
	
	^ (BioFASTAParser on: aString) tokenizeDescriptionText