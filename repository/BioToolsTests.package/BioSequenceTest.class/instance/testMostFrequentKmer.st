testing
testMostFrequentKmer

	self assert: ((('ACAACTATGCATCACTATCGGGAACTATCCT' asSequence mostFrequentKmer: 5) asArray collect: #asString) hasEqualElements: #('ACTAT')).
	self assert: ((('CGATATATCCATAG' asSequence mostFrequentKmer: 3) asArray  collect: #asString) hasEqualElements: #('ATA')).
