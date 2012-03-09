accessing public - databases
genomeprj
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGenomeProject new client: self )

		
