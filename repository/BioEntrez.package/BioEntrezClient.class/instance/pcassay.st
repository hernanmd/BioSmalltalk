accessing public - databases
pcassay
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPCAssay new client: self )

		
