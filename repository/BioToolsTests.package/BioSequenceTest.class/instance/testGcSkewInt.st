tests-accessing
testGcSkewInt

	self assert: (('GAGCCACCGCGATA' asSequence gcSkewInt) hasEqualElements: #(0 1 1 2 1 0 0 -1 -2 -1 -2 -1 -1 -1 -1)).
	self assert: (('CATGGGCATCGGCCATACGCC' asSequence gcSkewInt) hasEqualElements: #(0 -1 -1 -1 0 1 2 1 1 1 0 1 2 1 0 0 0 0 -1 0 -1 -2)).