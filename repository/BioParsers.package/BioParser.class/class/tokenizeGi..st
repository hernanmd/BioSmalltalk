instance creation
tokenizeGi: aString
	" Tokenize aString containing a gene identifier "
	
	^ ( BioGIParser on: aString ) tokenize