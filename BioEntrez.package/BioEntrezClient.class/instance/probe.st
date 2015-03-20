accessing public - databases
probe
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezProbe new client: self )

		
