accessing public - databases
gene
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGene new client: self )

		
