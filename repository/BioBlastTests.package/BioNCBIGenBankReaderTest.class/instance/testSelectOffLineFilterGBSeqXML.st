testing
testSelectOffLineFilterGBSeqXML

	| gbSeqCollection |
	
	gbSeqCollection := BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | ( obj at: 'GBAuthor' ) =  'Ferretti,L.' ] 
			from: self class testFilesDirectoryName.

	self deny: gbSeqCollection isEmpty.
	self assert: gbSeqCollection size equals: 3.
	self assert: (gbSeqCollection last at: 'GBAuthor') = 'Ferretti,L.'.
	self assert: (gbSeqCollection last at: 'GBReference_journal') = 'Submitted (25-AUG-2010) Dipartimento di Genetica e Microbiologia, University of Pavia, Via Ferrata, 1, Pavia 27100, Italy'.

	
