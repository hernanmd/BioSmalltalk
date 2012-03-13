testing
testGenBankRecords

	self needsWork.
"	( self confirm: 'This test will request 100 records to the Entrez system at NCBI 
	(restrictions may apply), are you sure?' translated )
		ifTrue: [
			| results |
			reader := BioNCBIBlastReader newFromXML: self resultBlastnDNA01.
			results := reader genBankRecordsAsXML. 
			self assert: ( results isKindOf: String ).
			self deny: results isEmpty.
			self assert: results isXML ]
"
