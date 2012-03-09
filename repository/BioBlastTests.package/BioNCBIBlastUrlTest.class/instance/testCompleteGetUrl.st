testing
testCompleteGetUrl

	| url |
	
	url := BioNCBIUrl absoluteFromText: self baseUrl.
	url startParameters: 'CMD=Get'.
	url addParameters: 'RID=954517013-7638-11119'.
	
	self assert: ( self decode: url asString ) =  
		'http://www.ncbi.nlm.nih.gov/blast/Blast.cgi?CMD=Get&RID=954517013-7638-11119'