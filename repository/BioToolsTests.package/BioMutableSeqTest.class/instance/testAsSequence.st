testing
testAsSequence

	| testMutSeq1 testSeq1 |

	testMutSeq1 := BioMutableSeq newWith: 'ACTGACGTAC' alphabet: BioIUPACUnambiguousDNA.
	testSeq1 := testMutSeq1 asSequence.

	self deny: (testSeq1 isKindOf: BioMutableSeq).
	self assert: testSeq1 asString equals: 'ACTGACGTAC'.
