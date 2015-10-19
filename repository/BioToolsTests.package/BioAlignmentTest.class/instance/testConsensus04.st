testing
testConsensus04

	align := self sampleAlignment04.	
	self assert: align consensus asString = 'ACTGCTAGCTAG'.
