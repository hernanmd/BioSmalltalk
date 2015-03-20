testing
testSetASN1

	| db |
	
	db := self entrezClient nuccore uids: #(12800).
	self deny: ( db url includesParameter: 'retmode' ).
	db setModeASN1.
	self assert: ( db url valueForParameter: 'retmode' ) = 'asn.1'.	