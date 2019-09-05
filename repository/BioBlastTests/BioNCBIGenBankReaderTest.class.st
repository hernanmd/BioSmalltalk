Class {
	#name : #BioNCBIGenBankReaderTest,
	#superclass : #BioAbstractTest,
	#instVars : [
		'reader'
	],
	#category : 'BioBlastTests-Core'
}

{ #category : #accessing }
BioNCBIGenBankReaderTest class >> testFilesDirectoryName [
	" Answer a <String> where the files for testing will be placed "
	
	^ (BioObject testFilesFullDirectoryName / 'GenBankTestFiles') fullName
]

{ #category : #accessing }
BioNCBIGenBankReaderTest class >> testXMLFilesDirectoryName [
	
	^ (self testFilesDirectoryName asFileReference / 'XML') fullName
]

{ #category : #testing }
BioNCBIGenBankReaderTest >> testAccessOffLineFilterGBSeqXML [

	| gbSeqCollection |
	gbSeqCollection := BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | true ] 
			from: self class testFilesDirectoryName.

	self assert: (gbSeqCollection first at: 'GBAuthor') = 'Bruniche-Olsen,A.'.
	self assert: (gbSeqCollection first at: 'GBReference_journal') =  'Submitted (04-JUL-2010) Zoology, University of Tasmania, Private Bag 5, Hobart, Tasmania 7001, Australia'.
	self assert: (gbSeqCollection last at: 'GBAuthor' ) = 'Ferretti,L.'.
	self assert: (gbSeqCollection last at: 'GBSeq_accession-version') =  'HQ184030.1'.

	

]

{ #category : #testing }
BioNCBIGenBankReaderTest >> testParseOffLineGBSeqXML [

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

	

]

{ #category : #testing }
BioNCBIGenBankReaderTest >> testReadGBSeqXML [

	| gbXMLCollection |
	
	gbXMLCollection := BioNCBIGenBankReader filesFromXMLDirectory: self class testFilesDirectoryName.
	
	self 
		assert: ( gbXMLCollection isKindOf: BioFileCollection ) 
		description: 'It could change to its own <Collection> like BioCSVFileCollection and BioFASTAFileCollection in the future'.

	self deny: gbXMLCollection isEmpty.

	self 
		assert: gbXMLCollection size = 2 
		description: 'This BioSmalltalk release include 2 GBSeq XML files'.
	
	self 
		assert: ( gbXMLCollection allSatisfy: [: file | file isKindOf: BioNCBIGenBankReader ] )
		description: 'It could change to its own <BioFile> like BioFASTAFile in the future'.
		
	self assert: ( gbXMLCollection allSatisfy: #hasContents ).

]

{ #category : #testing }
BioNCBIGenBankReaderTest >> testReadOffLineFilterGBSeqXML [

	| gbSeqCollection |
	
	gbSeqCollection := 
		BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | true ] 
			from: self class testFilesDirectoryName.
	self 
		assert: (gbSeqCollection isKindOf: BioGBSeqCollection) 
		description: 'A <Collection> of <Dictionary> of GBSeq nodes/values associations. To access BioSearchResult objects use methods beggining with #search...'.

	self deny: gbSeqCollection isEmpty.

	self 
		assert: gbSeqCollection size = 2 
		description: 'This BioSmalltalk release include 2 GBSeq XML "records"'.
	
	self 
		assert: (gbSeqCollection allSatisfy: [: file | file isKindOf: Dictionary ])
		description: 'It could change to its own <BioFile> like BioFASTAFile in the future'.
		
	self assert: (gbSeqCollection noneSatisfy: #isEmpty).
	

]

{ #category : #testing }
BioNCBIGenBankReaderTest >> testSearchOffLineFilterGBSeqXML [

	| gbSeqCollection |
	
	gbSeqCollection := 
		BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | true ] 
			from: self class testFilesDirectoryName.
	self 
		assert: (gbSeqCollection isKindOf: BioGBSeqCollection) 
		description: 'A <BioSearchResult> including GBSeq nodes/values associations.'.

	

]

{ #category : #testing }
BioNCBIGenBankReaderTest >> testSelectOffLineFilterGBSeqXML [

	| gbSeqCollection |
	
	gbSeqCollection := BioNCBIGenBankReader new 
			selectGenBankRecords: [: obj | ( obj at: 'GBAuthor' ) =  'Ferretti,L.' ] 
			from: self class testFilesDirectoryName.

	self deny: gbSeqCollection isEmpty.
	self assert: gbSeqCollection size equals: 1.
	self assert: (gbSeqCollection last at: 'GBAuthor') = 'Ferretti,L.'.
	self assert: (gbSeqCollection last at: 'GBReference_journal') = 'Submitted (25-AUG-2010) Dipartimento di Genetica e Microbiologia, University of Pavia, Via Ferrata, 1, Pavia 27100, Italy'.

	

]
