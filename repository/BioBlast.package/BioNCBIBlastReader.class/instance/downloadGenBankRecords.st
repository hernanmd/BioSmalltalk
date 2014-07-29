accessing-entrez
downloadGenBankRecords
	" On-Line version. Answer <true> if downloading was successfull "
	
	| filteredResult trWindow  |
	
	filteredResult := self contents.
	trWindow := self bioLog: 'Downloading GenBank records...'.
	self nextReader
		genBankRecordsAsXMLFrom: filteredResult contents
		database: self blastDbName;
		saveFilterContents.
	trWindow close.
	^ self nextReader contents
