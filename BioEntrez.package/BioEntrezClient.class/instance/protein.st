accessing public - databases
protein
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezProtein new client: self )

		
