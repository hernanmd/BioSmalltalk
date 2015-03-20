accessing public - databases
homologene
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezHomoloGene new client: self )

		
