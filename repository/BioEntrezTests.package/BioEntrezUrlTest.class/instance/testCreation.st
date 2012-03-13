testing
testCreation

	| url |
	
	url := BioEntrezUrl absoluteFromText: self baseUrl , 'db=pubmed&term=science[journal]+AND+breast+cancer+AND+2009[pdat]'.
	
	self assert: ( url isKindOf: BioEntrezUrl ).
	self assert: ( url asText isKindOf: Text ).
	self assert: ( url schemeName = 'http' ).
	self assert: ( url authority = 'eutils.ncbi.nlm.nih.gov' ).
