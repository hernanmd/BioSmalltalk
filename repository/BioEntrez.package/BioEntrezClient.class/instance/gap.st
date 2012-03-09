accessing public - databases
gap
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezDBGap new client: self )

		
