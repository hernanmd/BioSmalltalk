accessing-entrez
genBankRecordsAsXMLFrom: aCollection database: databaseName
	" With aCollection of BLASTHitNode's query the Entrez system
	at the database used by the receiver's current results and
	answer a String with XML contents "
	
	contents := 
		self
			genBankRecordsFrom: databaseName
			format: #setModeXML
			uids: ( self giListFrom: aCollection )
