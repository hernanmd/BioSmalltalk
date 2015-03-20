accessing public - databases
biosample
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezSample new client: self )

		
