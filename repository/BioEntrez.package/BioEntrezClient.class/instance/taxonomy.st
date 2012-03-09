accessing public - databases
taxonomy
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezTaxonomy new client: self )

		
