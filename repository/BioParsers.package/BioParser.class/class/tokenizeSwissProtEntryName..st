parse-ncbi-identifiers
tokenizeSwissProtEntryName: aString
	" Tokenize aString representing a Swiss-Prot identifier "
	
	^ (BioSwissProtParser on: aString) tokenizeSwissProtEntryName