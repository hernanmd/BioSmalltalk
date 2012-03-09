testing
testParseOffLineGBSeqXML

	| gbSeqReader |
	
	gbSeqReader := 
		BioNCBIGenBankReader new 
			parseXMLDocumentsFrom: self class testFilesDirectoryName.

	self assert: ( gbSeqReader isKindOf: BioNCBIGenBankReader ).
	self deny: gbSeqReader contents isEmpty.
	self assert: ( gbSeqReader contents isKindOf: BioNCBIGenBankResult ).
	" Ver si Dictionary = BioGBSeqRecord ? "
	" self assert: ( gbSeqReader contents allSatisfy: [: each | each isKindOf: Dictionary ] ). "
	
"	self assert: ( gbSeqReader contents first at: 'GBAuthor' ) =  'Bonfiglio,S.'.
	self assert: ( gbSeqReader contents last at: 'GBSeq_accession-version' ) =  'HQ184030.1'."

	
