accessing-entrez
genBankRecordsAsXML
	" Query the Entrez system using the receiver's gene identifiers list.
		Answer a XML String with the results. 
		If the receiver's contains more than #entrezUrlUidLimit gene identifiers then the resulting Collection will be splitted into XML Strings representing the results "
	
	self searchResults: ( 
		self 
			genBankRecordsFrom: self blastDbName 
			format: #setModeXML ).
	^ self searchResults size = 1
		ifTrue: [ self searchResults anyOne result ]
		ifFalse: [ self searchResults collect: #result ]