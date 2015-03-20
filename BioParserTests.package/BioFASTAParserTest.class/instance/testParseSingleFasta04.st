testing-builder
testParseSingleFasta04
	
	| seqName seqString |
	
	seqName := '>YAL068C-7235.2170 Putative promoter sequence'.
	seqString := 'TACGAGAATAATTTCTCATCATCCAGCTTTAACACAAAATTCGCACAGTTTTCGTTAAGAGAACTTAACATTTTCTTATGACGTAAATGAAGTTTATATATAAATTTCCTTTTTATTGGA'.

	fastaRecord := BioFastaRecord 
					named: seqName
					sequence: seqString.

	parseResult := self parserClass parseFasta: self fastaSeq04.
	self assert: ( parseResult isKindOf: BioFastaRecord ).
	self assert: parseResult = fastaRecord.
	self assert: parseResult name = seqName.
	self assert: parseResult sequence asString = seqString asCondensedString.