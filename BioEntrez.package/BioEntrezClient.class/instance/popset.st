accessing public - databases
popset
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPopSet new client: self )

		
