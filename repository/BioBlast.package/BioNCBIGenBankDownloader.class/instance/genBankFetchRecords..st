accessing
genBankFetchRecords: aCollection
	" Private - Fetch Entrez records from database named dbSymbol in format formatSymbol using UIDs from anArray. anArray is NOT splitted if exceeds #entrezUrlUidLimit "
	

	^ [ self prvGenBankFetchRecords: aCollection ]
	on: BioNotFoundObject 
	do: [ : ex | 
		| msg |
		msg := 'Database(s) not found in Entrez: ' , dbName asString, '. In doubt select nt/nr databases when doing a BLAST'.
		self bioLog: msg.
		self informMessage: msg.
		nil ].
