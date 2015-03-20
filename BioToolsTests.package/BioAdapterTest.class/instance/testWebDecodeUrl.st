testing
testWebDecodeUrl

	| decoded encodedAddress decodedAddress |
	
	" WebClient "
	decodedAddress := 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
	encodedAddress := 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi%3Fdb%3Dnuccore%26term%3Dscience%5Bjournal%5D%2BAND%2Bbreast%2Bcancer%2BAND%2B2009%5Bpdat%5D'.
	decoded := BioWebClientEngine decode: encodedAddress.

	self deny: decoded isNil.
	self assert: ( decoded isKindOf: String ). 
	self assert: decoded = decodedAddress.

	" Zn "
	decoded := BioWebClientEngine decode: encodedAddress.

	self deny: decoded isNil.
	self assert: ( decoded isKindOf: String ). 
	self assert: decoded = decodedAddress.
	
	" HTTPClient "
	decoded := BioWebClientEngine decode: encodedAddress.

	self deny: decoded isNil.
	self assert: ( decoded isKindOf: String ). 
	self assert: decoded = decodedAddress.