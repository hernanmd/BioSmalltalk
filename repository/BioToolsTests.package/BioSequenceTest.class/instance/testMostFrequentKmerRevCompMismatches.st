testing
testMostFrequentKmerRevCompMismatches

	self assert: ((('ACGTTGCATGTCGCATGATGCATGAGAGCT' asDNASimpleSequence mostFrequentKmerRevComp: 4 mismatches: 1) asArray collect: #asString) includesAllOf: #('ACAT' 'ATGT')).
	self assert: (((('AAAAAAAAAA' asDNASimpleSequence mostFrequentKmerRevComp: 2 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('AT' 'TA'	) sorted)).
	self assert: ((('AGTCAGTC' asDNASimpleSequence mostFrequentKmerRevComp: 4 mismatches: 2) asArray sorted collect: #asString) hasEqualElements: #('AATT' 'GGCC') sorted).
	self assert: ((('ATA' asDNASimpleSequence mostFrequentKmerRevComp: 3 mismatches: 1) asArray sorted collect: #asString) hasEqualElements: #('GAT' 'CTA' 'TAG' 'TTA' 'ATT' 'ATA' 'AGA' 'GTA' 'ACA' 'ATC' 'TCT' 'CAT' 'TGT' 'TTT' 'ATG' 'TAT' 'TAA' 'AAT' 'AAA' 'TAC') sorted).
	
	self assert: (('AAT' asDNASimpleSequence mostFrequentKmerRevComp: 3 mismatches: 0) asArray sorted hasEqualElements: #('AAT' 'ATT') sorted).
	self assert: (('TAGCG' asDNASimpleSequence mostFrequentKmerRevComp: 2 mismatches: 1) asArray sorted hasEqualElements: #('CA' 'CC' 'GG' 'TG') sorted).

