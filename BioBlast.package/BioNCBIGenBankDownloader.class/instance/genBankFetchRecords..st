accessing
genBankFetchRecords: aCollection
	" Private - Fetch Entrez records from database named dbSymbol in format formatSymbol using UIDs from anArray. anArray is NOT splitted if exceeds #entrezUrlUidLimit "
	
	| db entrezDbName |
	
	entrezDbName := (BioEntrezDatabase dbClassOf: self dbName) dbName.
	db := BioEntrezClient new perform: entrezDbName asSymbol.
	^ db
		perform: self format;	
		uids: aCollection ;
		fetch.