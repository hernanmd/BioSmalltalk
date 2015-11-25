testing
testAddSequence01

	align := self sampleAlignment01.
	self assert: align size = 3.
	self assert: align sequenceNames asArray = #('Alpha' 'Beta' 'Gamma').
	self assert: align sequenceStrings asArray = #('ACTGCTAGCTAG' 'ACT-CTAGCTAG' 'ACTGCTAGATAG').