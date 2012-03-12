testing-builder
testParseMultiFasta03

	| seqName seqString |
	
	seqString := self multiFastaSeq03.

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord sequences
		add: ( BioFastaRecord named: self multiFastaSeq03Header01 sequence: self multiFastaSeq03Body01 );
		add: ( BioFastaRecord named: self multiFastaSeq03Header02 sequence: self multiFastaSeq03Body02 ).

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq03.
	self assert: ( parseResult isKindOf: BioFastaMultiRecord ).
	self deny: parseResult sequences isEmpty.		
	self assert: parseResult sequences size = 2.
	self assert: parseResult = fastaRecord.
	self assert: parseResult sequenceNames asArray = 
						( Array 
							with: self multiFastaSeq03Header01 
							with: self multiFastaSeq03Header02 ).
	self assert: parseResult sequenceStrings asArray = 
						( Array 
							with: self multiFastaSeq03Body01 asCondensedString
							with: self multiFastaSeq03Body02 asCondensedString ).	
	