testing
testCompletePutUrl

	| url |
	
	url := BioNCBIUrl2 fromString: self baseUrl.
	url 
		queryAt: 'CMD' put: 'Put';
		queryAt: 'DATABASE' put: 'nr';
		queryAt: 'QUERY' put: 555;
		queryAt: 'HITLIST_SIZE' put: 10;
		queryAt: 'FILTER' put: 'L';
		queryAt: 'EXPECT' put: 10;
		queryAt: 'PROGRAM' put: 'blastn';
		queryAt: 'SERVICE' put: 'plain'.
	
	self assert: (BioWebClientEngine decode: url asString) =  
		'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Put&DATABASE=nr&QUERY=555&HITLIST_SIZE=10&FILTER=L&EXPECT=10&PROGRAM=blastn&SERVICE=plain'