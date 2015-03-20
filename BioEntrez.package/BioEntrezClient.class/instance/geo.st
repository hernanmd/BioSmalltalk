accessing public - databases
geo
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGEO new client: self )

		
