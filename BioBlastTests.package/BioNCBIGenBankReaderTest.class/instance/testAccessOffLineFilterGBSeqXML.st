testing
testAccessOffLineFilterGBSeqXML

	| gbSeqCollection |
	gbSeqCollection := BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | true ] 
			from: self class testFilesDirectoryName.

	self assert: (gbSeqCollection first at: 'GBAuthor') = 'Bruniche-Olsen,A.'.
	self assert: (gbSeqCollection first at: 'GBReference_journal') =  'Submitted (04-JUL-2010) Zoology, University of Tasmania, Private Bag 5, Hobart, Tasmania 7001, Australia'.
	self assert: (gbSeqCollection last at: 'GBAuthor' ) = 'Ferretti,L.'.
	self assert: (gbSeqCollection last at: 'GBSeq_accession-version') =  'HQ184030.1'.

	
