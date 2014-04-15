testing
testAccessOffLineFilterGBSeqXML

	| gbSeqCollection |
	
	gbSeqCollection := 
		BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | true ] 
			from: self class testFilesDirectoryName.

	self assert: ( gbSeqCollection first at: 'GBAuthor' ) = 'Derr,J.N.'.
	self assert: ( gbSeqCollection first at: 'GBReference_journal' ) =  'Submitted (26-FEB-2010) Department of Veterinary Pathobiology, Texas A&M University, 4467 TAMU, College Station, TX 77843, USA'.
	self assert: ( gbSeqCollection last at: 'GBAuthor' ) = 'Ferretti,L.'.
	self assert: ( gbSeqCollection last at: 'GBSeq_accession-version' ) =  'HQ184030.1'.

	
