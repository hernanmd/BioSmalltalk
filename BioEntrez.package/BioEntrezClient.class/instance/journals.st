accessing public - databases
journals
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezJournals new client: self )

		
