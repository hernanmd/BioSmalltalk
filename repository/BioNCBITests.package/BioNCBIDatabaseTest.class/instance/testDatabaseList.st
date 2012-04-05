testing
testDatabaseList

	| dbList |
	
	dbList := BioNCBIDatabase databaseList.
	
	self assert: ( dbList isKindOf: Collection ).
	self deny: dbList isEmpty.
	
