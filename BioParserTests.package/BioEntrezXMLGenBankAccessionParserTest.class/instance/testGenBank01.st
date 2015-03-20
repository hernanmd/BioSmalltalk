testing
testGenBank01
	
	parseResult := self parserClass parse: self gbSet01.
	self assert: (parseResult isKindOf: Collection).
	self assert: parseResult size = 1.
	self assert: (parseResult anyOne isKindOf: Dictionary).
	self assert: (parseResult first at: BioGBSeqCollection qualifierForAccessionWithVersion) =  'HQ184032.1'.
	self assert: (parseResult first at: 'GBSeq_definition') = 'Bos taurus isolate Chi597 mitochondrion, complete genome'.
