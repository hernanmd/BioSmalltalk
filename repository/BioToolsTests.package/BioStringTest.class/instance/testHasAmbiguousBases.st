testing
testHasAmbiguousBases

	self assert: 'atgCtgAccR' hasAmbiguousDNABases.
	self deny: 'attcggaggat' hasAmbiguousDNABases.