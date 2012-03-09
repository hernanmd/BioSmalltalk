testing
testReadGBSeqXML

	| gbXMLCollection |
	
	gbXMLCollection := BioNCBIGenBankReader filesFromXMLDirectory: self class testFilesDirectoryName.
	
	self 
		assert: ( gbXMLCollection isKindOf: BioFileDirectoryCollection ) 
		description: 'It could change to its own <Collection> like BioCSVFileCollection and BioFASTAFileCollection in the future'.

	self deny: gbXMLCollection isEmpty.

	self 
		assert: gbXMLCollection size = 2 
		description: 'This BioSmalltalk release include 2 GBSeq XML files'.
	
	self 
		assert: ( gbXMLCollection allSatisfy: [: file | file isKindOf: BioNCBIGenBankReader ] )
		description: 'It could change to its own <BioFile> like BioFASTAFile in the future'.
		
	self assert: ( gbXMLCollection allSatisfy: #hasContents ).
