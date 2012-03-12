testing-builder
testParseSingleFasta02

	fastaRecord := BioFastaRecord 
					named: self multiFastaSeq01Header01
					sequence: self multiFastaSeq01Body01.

	parseResult := self parserClass parseFasta: self fastaSeq01.
	self assert: ( parseResult isKindOf: BioFastaRecord ).
	self assert: parseResult = fastaRecord.
	self assert: parseResult name = self multiFastaSeq01Header01.
	self assert: parseResult sequence asString = self multiFastaSeq01Body01 asCondensedString.	
	