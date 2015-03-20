accessing public - databases
nlmcatalog
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezNLMCatalog new client: self )

		
