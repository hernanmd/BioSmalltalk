testing
testSequenceAsPhylipString

	align := self sampleAlignment01.
	self assert: align asPhylipString = '3 12
Alpha     ACTGCTAGCTAG
Beta      ACT-CTAGCTAG
Gamma     ACTGCTAGATAG
'
