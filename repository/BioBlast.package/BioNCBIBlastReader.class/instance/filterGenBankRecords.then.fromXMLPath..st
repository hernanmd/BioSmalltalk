accessing-entrez
filterGenBankRecords: selectBlock then: postBlock fromXMLPath: aDataSource
	" Off-Line version "

	self nextReader: ( self genBankReaderClass new parseXMLDocumentsFrom: aDataSource ).
	^ self nextReader
		selectGenBankRecords: selectBlock 
		then: postBlock
