testing
testSequenceAsFastaString

	align := self sampleAlignment01.
	self assert: align asMultiFastaString = '>Alpha
ACTGCTAGCTAG
>Beta
ACT-CTAGCTAG
>Gamma
ACTGCTAGATAG
'
