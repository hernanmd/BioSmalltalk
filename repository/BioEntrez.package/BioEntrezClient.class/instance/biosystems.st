accessing public - databases
biosystems
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezBioSystems new client: self )

		
