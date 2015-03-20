parse-ncbi-identifiers
parseAccession: aString
	" Parse aString containing an accession number and answer an accession instance "
	
	^ ( BioAccessionParser on: aString ) parse