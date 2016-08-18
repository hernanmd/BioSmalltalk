private
prvGenBankFetchRecords: aCollection 

	| db entrezDbName |

	entrezDbName := (BioEntrezDatabase dbClassOf: self dbName) dbName. 
	db := BioEntrezClient new perform: entrezDbName asSymbol.	
	^ db
		perform: self format;	
		uids: aCollection ;
		fetch
	