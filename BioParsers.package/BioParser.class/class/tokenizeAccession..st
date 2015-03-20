parse-ncbi-identifiers
tokenizeAccession: aString
	" Tokenize aString containing an accession number "
	
	^ (BioAccessionParser on: aString) tokenize