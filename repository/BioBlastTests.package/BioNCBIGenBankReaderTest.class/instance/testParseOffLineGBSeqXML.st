testing
testParseOffLineGBSeqXML

	| gbSeqReader |
	
	gbSeqReader := 
		BioNCBIGenBankReader new 
			parser: BioEntrezXMLGBBasicParser;
			parseXMLDocumentsFromDirectory: self class testXMLFilesDirectoryName.

	self assert: (gbSeqReader isKindOf: BioNCBIGenBankReader).
	self deny: gbSeqReader contents isEmpty.
	self assert: (gbSeqReader contents isKindOf: BioNCBIGenBankResult).
	
"	self assert: ( gbSeqReader contents first at: 'GBAuthor' ) =  'Bonfiglio,S.'.
	self assert: ( gbSeqReader contents last at: 'GBSeq_accession-version' ) =  'HQ184030.1'."

	
