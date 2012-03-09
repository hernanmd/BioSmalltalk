accessing public - databases
gds
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezGDS new client: self )

		
