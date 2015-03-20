accessing
genBankSplitRecordsFrom: dbSymbol format: formatSymbol uids: anArray
	" Private - Break the request into smaller chunks splittin anArray of UIDs.
	Answer a Collection of Collections to be joined "
	
	self 
		dbName: dbSymbol;
		format: formatSymbol;
		uids: anArray.
	^ self exceedsLimit
		ifTrue: [ self splitDownload ]
		ifFalse: [ self download ]