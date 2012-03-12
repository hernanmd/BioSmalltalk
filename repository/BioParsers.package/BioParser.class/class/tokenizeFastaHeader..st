parse-fasta
tokenizeFastaHeader: aString
	" Tokenize aString representing a FASTA header String "
	
	^ ( BioFASTAParser on: aString ) tokenizeDescriptionLine