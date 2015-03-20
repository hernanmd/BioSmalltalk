accessing public - databases
unigene
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezUniGene new client: self )

		
