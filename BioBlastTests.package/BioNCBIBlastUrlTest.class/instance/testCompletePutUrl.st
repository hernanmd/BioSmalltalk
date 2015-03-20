testing
testCompletePutUrl

	| url |
	
	url := BioNCBIUrl absoluteFromText: self baseUrl.
	url startParameters: 'CMD=Put'.
	url addParameters: 'DATABASE=nr&QUERY=555&HITLIST_SIZE=10&FILTER=L&EXPECT=10&PROGRAM=blastn&SERVICE=plain'.
	
	self assert: (BioWebClientEngine decode: url asString) =  
		'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&QUERY=555&HITLIST_SIZE=10&FILTER=L&EXPECT=10&PROGRAM=blastn&SERVICE=plain'