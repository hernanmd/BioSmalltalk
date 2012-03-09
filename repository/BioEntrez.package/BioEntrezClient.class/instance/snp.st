accessing public - databases
snp
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezSNP new client: self )

		
