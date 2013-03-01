accessing-entrez
downloadGenBankRecordsInFolder: aPath
	" On-Line version. Answer <true> if downloading was successfull "
	
	| filteredResult seqRecords downloadStatus |
	
	filteredResult := self contents.
	self nextReader: self genBankReaderClass new.
	downloadStatus := self nextReader
			genBankRecordsAsXMLFrom: filteredResult contents
			database: self blastDbName;
			saveFilterContentsIn: aPath.
	downloadStatus
		ifTrue: [ 
			self inform: 'GenBank records downloaded successfully' translated.
			seqRecords := self processGenBankRecords.
			self nextReader contents: seqRecords.
			self inform: 'Dowloaded GenBank records are valid' translated ]
		ifFalse: [ self inform: 'ERROR: GenBank records couldn''t have been downloaded' translated ].
