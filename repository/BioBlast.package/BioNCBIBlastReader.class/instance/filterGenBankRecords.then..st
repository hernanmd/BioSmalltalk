accessing-entrez
filterGenBankRecords: selectBlock then: postBlock
	" On-Line version "
	
	| filteredResult seqRecords |
	
	filteredResult := self contents.
	self nextReader: BioNCBIGenBankReader new.
	self nextReader
			genBankRecordsAsXMLFrom: filteredResult contents
			database: self blastDbName;
			saveFilterContents.
	seqRecords := ( BioGBSeqCollection newFromXMLCollection: self nextReader entrezSearchResults ) parseDocuments.
	self nextReader
		contents: seqRecords.
	^ nextReader 
		selectGenBankRecords: selectBlock 
		then: postBlock