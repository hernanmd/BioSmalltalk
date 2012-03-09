instance creation
tokenizeLocus: aString
	" Tokenize aString containing an accession number "
	
	^ ( BioGBParser on: aString ) tokenizeLocus