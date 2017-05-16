testing
testSetText

	| db |
	
	db := self entrezClient nuccore uids: #(12800).
	self deny: (db url includesParameter: 'retmode').
	db setModeText.	
	self assert: (db url valueForParameter: 'retmode') equals: 'text'.	