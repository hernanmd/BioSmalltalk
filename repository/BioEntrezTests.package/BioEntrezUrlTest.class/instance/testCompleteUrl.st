testing
testCompleteUrl

	| url |
	
	url := BioEntrezUrl absoluteFromText: self baseUrl.
	url dbName: 'nuccore'.	
	url cmdName: 'esearch.fcgi?'.
	url addParameters: '&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.

	self assert: (BioWebClientEngine decode: url asString) =  
		'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'