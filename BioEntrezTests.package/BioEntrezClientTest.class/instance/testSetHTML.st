testing
testSetHTML

	| db |
	
	db := self entrezClient nuccore uids: #(12800).
	self deny: ( db url includesParameter: 'retmode' ).
	db setModeHTML.	
	self assert: ( db url valueForParameter: 'retmode' ) = 'html'.