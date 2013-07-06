testing
testClassFor

	self assert: (self parserClass classFor: 'pdb') = BioBrookhavenProtParser.
	self assert: (self parserClass classFor: 'bbs') = BioGIBackBoneIdParser.
	self assert: (self parserClass classFor: 'dbj') = BioDDBJParser.
	self assert: (self parserClass classFor: 'emb') = BioEMBLParser.
	self assert: (self parserClass classFor: 'ref') = BioRefSeqParser.
	self assert: (self parserClass classFor: 'sp') = BioSwissProtParser.	
"	self assert: (self parserClass classFor: 'gi') = .
	self assert: (self parserClass classFor: 'gnl') = .
	self assert: (self parserClass classFor: 'lcl') = .
	self assert: (self parserClass classFor: 'pat') = .
	self assert: (self parserClass classFor: 'pir') = .
	self assert: (self parserClass classFor: 'prf') = .
	self assert: (self parserClass classFor: 'gb') = .	
"
