testing
testKmersCountMismatches

	self assert: ('TTTAGAGCCTTCAGAGG' asSequence kmersCount: 'GAGG' mismatches: 2) equals: 4.
	self assert: ('AAA' asSequence kmersCount: 'AA' mismatches: 0) equals: 2.
	self assert: ('ATA' asSequence kmersCount: 'ATA' mismatches: 1) equals: 1.

