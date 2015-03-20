accessing public - databases
books
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezBooks new client: self )

		
