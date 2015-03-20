testing-builder
testParseMultiFasta02

	| seqName seqString |
	
	seqString := self multiFastaSeq02.

	fastaRecord := BioFastaMultiRecord new.
	fastaRecord sequences
		add: ( BioFastaRecord named: self multiFastaSeq02Header01 sequence: self multiFastaSeq02Body01 );
		add: ( BioFastaRecord named: self multiFastaSeq02Header02 sequence: self multiFastaSeq02Body02 );
		add: ( BioFastaRecord named: self multiFastaSeq02Header03 sequence: self multiFastaSeq02Body03 ).		

	parseResult := self parserClass parseMultiFasta: self multiFastaSeq02.
	self assert: ( parseResult isKindOf: BioFastaMultiRecord ).
	self deny: parseResult sequences isEmpty.		
	self assert: parseResult sequences size = 3.
	self assert: parseResult = fastaRecord.
	self assert: parseResult sequenceNames asArray = 
						( Array 
							with: self multiFastaSeq02Header01 
							with: self multiFastaSeq02Header02
							with: self multiFastaSeq02Header03 ).

	self assert: parseResult sequenceStrings asArray = 
						( Array 
							with: self multiFastaSeq02Body01 asCondensedString
							with: self multiFastaSeq02Body02 asCondensedString
							with: self multiFastaSeq02Body03 asCondensedString ).	