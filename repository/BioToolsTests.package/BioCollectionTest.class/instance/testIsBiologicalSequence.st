testing
testIsBiologicalSequence

	self assert: 'ACGT' isBiologicalSequence.
	self assert: 'TWRP' isBiologicalSequence.
	
	self deny: 1 isBiologicalSequence.
	self deny: $. isBiologicalSequence.
	self deny: '    ' isBiologicalSequence.
	self deny: '' isBiologicalSequence.
	self deny: OrderedCollection new isBiologicalSequence.