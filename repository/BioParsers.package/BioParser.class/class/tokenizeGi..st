parse-ncbi-identifiers
tokenizeGi: aString
	" Tokenize aString containing a gene identifier "
	
	^ ( BioGIParser on: aString ) tokenize