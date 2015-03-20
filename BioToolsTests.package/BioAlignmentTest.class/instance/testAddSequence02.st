testing
testAddSequence02

	align := self sampleAlignment01.	

	self assert: align size = 3.
	self assert: ( align sequenceNames bioHasEqualElements: #( 'Alpha' 'Beta' 'Gamma' ) ).
	self assert: ( align sequenceStrings bioHasEqualElements: #('ACTGCTAGCTAG' 'ACT-CTAGCTAG' 'ACTGCTAGATAG') ).