accessing public - databases
pmc
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPubMedCentral new client: self )

		
