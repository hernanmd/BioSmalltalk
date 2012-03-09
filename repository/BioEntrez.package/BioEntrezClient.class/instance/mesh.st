accessing public - databases
mesh
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezMeSH new client: self )

		
