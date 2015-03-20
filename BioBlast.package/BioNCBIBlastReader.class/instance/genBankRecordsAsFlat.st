accessing-entrez
genBankRecordsAsFlat
	" Private - Answer a Collection of GenBank records in GenBank Flat File Format using the gene identifiers from the receiver's contents "
	
	self searchResults: (self genBankRecordsFrom: self blastDbName format: #setModeGb).
	^ self searchResults size = 1
		ifTrue: [ self searchResults anyOne result ]
		ifFalse: [ self searchResults collect: #result ]
