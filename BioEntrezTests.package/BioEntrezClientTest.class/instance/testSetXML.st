testing
testSetXML

	| db |
	
	db := self entrezClient nuccore uids: #(12800).
	self deny: ( db url includesParameter: 'retmode' ).
	db setModeXML.
	self assert: ( db url valueForParameter: 'retmode' ) = 'xml'.