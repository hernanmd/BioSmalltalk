accessing public - databases
domains
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezSDI new client: self )

		
