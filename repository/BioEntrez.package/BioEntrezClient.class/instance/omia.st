accessing public - databases
omia
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezOMIA new client: self )

		
