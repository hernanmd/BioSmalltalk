accessing public - databases
omim
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezOMIM new client: self )

		
