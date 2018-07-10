testing
testMostFrequentKmer

	self assert: (('ACAACTATGCATCACTATCGGGAACTATCCT' asSequence mostFrequentKmer: 5) hasEqualElements: #('ACTAT')).
	self assert: (('CGATATATCCATAG' asSequence mostFrequentKmer: 3) hasEqualElements: #('ATA')).
