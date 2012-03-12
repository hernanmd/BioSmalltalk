testing
testSequenceAsPhylipString

	align := self sampleAlignment01.
	
	self needsWork.
"	self assert: align asPhylipString = '3 12
        Alpha      ACTGCTAGCT AG
        Beta       ACT-CTAGCT AG
        Gamma      ACTGCTAGAT AG'
"