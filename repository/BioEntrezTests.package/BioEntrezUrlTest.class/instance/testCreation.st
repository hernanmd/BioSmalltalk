testing
testCreation

	url := BioEntrezUrl fromString: self baseUrl , 'db=pubmed&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
	self assert: (url isKindOf: BioEntrezUrl).
	self assert: (url asString isKindOf: String).
	self assert: url scheme equals: 'https'.
	self assert: url authority equals: 'eutils.ncbi.nlm.nih.gov'.
