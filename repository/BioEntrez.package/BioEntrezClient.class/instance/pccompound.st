accessing public - databases
pccompound
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPCCompound new client: self )

		
