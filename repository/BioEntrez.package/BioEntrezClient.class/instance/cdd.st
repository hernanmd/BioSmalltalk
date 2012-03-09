accessing public - databases
cdd
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezConservedDomains new client: self )

		
