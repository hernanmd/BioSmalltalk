testing
testMostFrequentKmerMismatches

	self assert: ((('AAAAAAAAAA' asSequence mostFrequentKmer: 2 mismatches: 1) asArray collect: #asString) includesAllOf: #('AA' 'AC' 'AG' 'CA' 'AT' 'GA' 'TA')).
	self assert: (((('ATA' asSequence mostFrequentKmer: 3 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('GTA' 'ACA' 'AAA' 'ATC' 'ATA' 'AGA' 'ATT' 'CTA' 'TTA' 'ATG') sorted)).
	self assert: ((('AAT' asSequence mostFrequentKmer: 3 mismatches: 0) asArray collect: #asString) hasEqualElements: #('AAT')).
	self assert: ((('TAGCG' asSequence mostFrequentKmer: 2 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('GG' 'TG') sorted).
	
	self assert: (('ACGTTGCATGTCGCATGATGCATGAGAGCT' asSequence mostFrequentKmer: 4 mismatches: 1) asArray sorted hasEqualElements: #('GATG' 'ATGC' 'ATGT') sorted).
	self assert: (('AGTCAGTC' asSequence mostFrequentKmer: 4 mismatches: 2) asArray sorted hasEqualElements: #('TCTC' 'CGGC' 'AAGC' 'TGTG' 'GGCC' 'AGGT' 'ATCC' 'ACTG' 'ACAC' 'AGAG' 'ATTA' 'TGAC' 'AATT' 'CGTT' 'GTTC' 'GGTA' 'AGCA' 'CATC') sorted).
	self assert: (('AATTAATTGGTAGGTAGGTA' asSequence mostFrequentKmer: 4 mismatches: 0) asArray sorted hasEqualElements: #('GGTA')).
