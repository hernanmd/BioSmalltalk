accessing-entrez
genBankFetchRecordsFrom: dbSymbol format: formatSymbol uids: anArray
	" Private - 	Fetch Entrez records from database named dbSymbol in format formatSymbol
	using UIDs from anArray. anArray is NOT splitted if exceeds #entrezUrlUidLimit "
	
	| db dbName |
	
	dbName := ( BioEntrezDatabase dbClassOf: dbSymbol ) dbName.
	db := BioEntrezClient new perform: dbName asSymbol.
	^ db
		perform: formatSymbol;	
		uids: anArray;
		fetch.