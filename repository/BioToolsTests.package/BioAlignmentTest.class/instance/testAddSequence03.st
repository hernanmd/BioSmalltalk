testing
testAddSequence03

	| seqNames |
	
	seqNames := ( 1 to: 5 ) collect: #asString.
	align := self sampleAlignment03.	

	self assert: align size = 5.
	self assert: ( align sequenceNames bioHasEqualElements: seqNames ).
	self assert: ( align sequenceStrings bioHasEqualElements: #('ACTGCTAGCTAG' 'ACT-CTAGCTAG' 'ACTGCTAGATAG' 'ACTGCTTGCTAG' 'ACTGCTTGATAG') ).