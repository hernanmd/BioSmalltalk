accessing public - databases
nucest
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezEST new client: self )

		
