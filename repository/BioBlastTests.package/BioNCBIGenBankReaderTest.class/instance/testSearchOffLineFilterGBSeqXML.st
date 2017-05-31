testing
testSearchOffLineFilterGBSeqXML

	| gbSeqCollection |
	
	gbSeqCollection := 
		BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | true ] 
			from: self class testFilesDirectoryName.
	self 
		assert: (gbSeqCollection isKindOf: BioGBSeqCollection) 
		description: 'A <BioSearchResult> including GBSeq nodes/values associations.'.

	
