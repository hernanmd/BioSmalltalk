accessing public - databases
genome
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGenome new client: self )

		
