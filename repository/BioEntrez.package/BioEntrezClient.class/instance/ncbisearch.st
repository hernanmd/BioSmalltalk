accessing public - databases
ncbisearch
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezWebSite new client: self )

		
