testing
testCreation

	url := BioEntrezUrl2 fromString: self baseUrl , 'db=pubmed&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
	
	self assert: (url isKindOf: BioEntrezUrl2).
	self assert: (url asString isKindOf: String).
	self assert: (url scheme = 'http').
	self assert: (url authority = 'eutils.ncbi.nlm.nih.gov').
