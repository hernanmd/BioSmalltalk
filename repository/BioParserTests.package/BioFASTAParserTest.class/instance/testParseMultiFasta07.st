testing-builder
testParseMultiFasta07

	fastaRecord := BioFastaMultiRecord new
		addFastaRecord: (BioFastaRecord named: '>Sample sequence 1' sequence: 'garkbdctymvhu');
		addFastaRecord: (BioFastaRecord named: '>Sample sequence 2' sequence: 'ctymvhgarkbda');
		addFastaRecord: (BioFastaRecord named: '>Sample sequence 3' sequence: 'ccccccccccga');
		yourself.
	parseResult := self parserClass parseMultiFasta: self multiFastaSeq07 .
	self assert: (parseResult isKindOf: BioFastaMultiRecord).
	self deny: parseResult sequences isEmpty.		
	self assert: parseResult sequences size = 3.
	self assert: parseResult = fastaRecord.
