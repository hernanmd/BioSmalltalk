converting
asGenBankResults
	" Answer a new results objects "

	^ (BioResultObject for: self)
		result: self;
		yourself
		

