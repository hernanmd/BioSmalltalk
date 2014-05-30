testing
testCompleteUrl
	
	url := (BioEntrezUrl2 fromString: self baseUrl)
		dbName: 'nuccore';
		cmdName: 'esearch.fcgi';
		addParameters: '&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.

	self assert: (BioWebClientEngine decode: url asString) equals: 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?term=science[journal]+AND+breast+cancer+AND+2009[pdat]&db=nuccore'.
		
	url := (BioEntrezUrl2 fromString: self baseUrl)
		dbName: 'nuccore';
		cmdName: 'esearch.fcgi';
		addParameters: 'term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
		
	self assert: (BioWebClientEngine decode: url asString) equals: 'http://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?term=science[journal]+AND+breast+cancer+AND+2009[pdat]&db=nuccore'.