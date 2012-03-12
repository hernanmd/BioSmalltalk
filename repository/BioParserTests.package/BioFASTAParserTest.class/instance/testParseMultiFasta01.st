testing-builder
testParseMultiFasta01

	| seqName seqString |
	
	seqString := self multiFastaSeq01.

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord sequences
		add: ( BioFastaRecord named: self multiFastaSeq01Header01 sequence: self multiFastaSeq01Body01 );
		add: ( BioFastaRecord named: self multiFastaSeq01Header02 sequence: self multiFastaSeq01Body02 ).

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq01.
	self assert: ( parseResult isKindOf: BioFastaMultiRecord ).
	self deny: parseResult sequences isEmpty.		
	self assert: parseResult sequences size = 2.	
	self assert: parseResult = fastaRecord.
	self assert: parseResult sequenceNames asArray = 
				( Array with: self multiFastaSeq01Header01 
						with: self multiFastaSeq01Header02 ).
	self assert: parseResult sequenceStrings asArray = 
				( Array with: self multiFastaSeq01Body01 asCondensedString 
						with: self multiFastaSeq01Body02 asCondensedString ).	