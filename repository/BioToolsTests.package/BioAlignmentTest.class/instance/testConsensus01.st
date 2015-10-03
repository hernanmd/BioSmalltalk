testing
testConsensus01

	align := self sampleAlignment01.	

	self assert: align consensus asString = 'ACTGCTAGCTAG'.
