accessing public - databases
structure
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezStructure new client: self )

		
