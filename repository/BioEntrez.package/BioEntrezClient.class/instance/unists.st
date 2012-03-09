accessing public - databases
unists
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezUniSTS new client: self )

		
