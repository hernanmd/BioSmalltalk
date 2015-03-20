testing
testHasAmbiguousBases

	self assert: 'atgCtgAccR' hasAmbiguousDNABases.
	self deny: 'attcggaggat' hasAmbiguousDNABases.
	
	self deny: 'ACGU' hasAmbiguousRNABases.
	self assert: 'AUGCAUCAGRYAUCUGU' hasAmbiguousRNABases.