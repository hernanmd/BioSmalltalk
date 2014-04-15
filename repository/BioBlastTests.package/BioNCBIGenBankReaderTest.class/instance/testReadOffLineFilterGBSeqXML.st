testing
testReadOffLineFilterGBSeqXML

	| gbSeqCollection |
	
	gbSeqCollection := 
		BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | true ] 
			from: self class testFilesDirectoryName.

	self 
		assert: ( gbSeqCollection isKindOf: BioGBSeqCollection ) 
		description: 'A <Collection> of <Dictionary> of GBSeq nodes/values associations. To access BioSearchResult objects use methods beggining with #search...'.

	self deny: gbSeqCollection isEmpty.

	self 
		assert: gbSeqCollection size = 5 
		description: 'This BioSmalltalk release include 5 GBSeq XML "records"'.
	
	self 
		assert: ( gbSeqCollection allSatisfy: [: file | file isKindOf: Dictionary ] )
		description: 'It could change to its own <BioFile> like BioFASTAFile in the future'.
		
	self assert: ( gbSeqCollection noneSatisfy: #isEmpty ).
	
