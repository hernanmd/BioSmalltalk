accessing public - databases
gensat
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGenSat new client: self )

		
