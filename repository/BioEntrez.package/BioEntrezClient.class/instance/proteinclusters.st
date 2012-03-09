accessing public - databases
proteinclusters
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezProteinClusters new client: self )

		
