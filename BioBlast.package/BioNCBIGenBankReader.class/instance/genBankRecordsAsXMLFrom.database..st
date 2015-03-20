accessing-entrez
genBankRecordsAsXMLFrom: aBioBlastParentNodeCollection database: databaseName
	" With aBioBlastParentNodeCollection of BLASTHitNode's, query the Entrez system at databaseName and answer a <String> with XML contents "
	
	contents := self
			genBankRecordsFrom: databaseName
			format: #setModeXML
			uids: (self giListFrom: aBioBlastParentNodeCollection)
