accessing public - databases
nucgss
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGSS new client: self )

		
