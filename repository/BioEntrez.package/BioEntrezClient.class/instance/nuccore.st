accessing public - databases
nuccore
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezNuccore new client: self )

		
