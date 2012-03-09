accessing public - databases
sra
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezSRA new client: self )

		
