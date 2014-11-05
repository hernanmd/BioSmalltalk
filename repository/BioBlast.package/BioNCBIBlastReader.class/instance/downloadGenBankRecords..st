as yet unclassified
downloadGenBankRecords: aBioResultObjet
	" On-Line version. Answer <true> if downloading was successfull "
	
	| trWindow  |
	
	trWindow := self bioLog: 'Downloading GenBank records...'.
	self nextReader
		genBankRecordsAsXMLFrom: aBioResultObjet contents
		database: self blastDbName;
		saveFilterContents.
	trWindow close.
	self halt.
	^ self nextReader contents
