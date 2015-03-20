accessing public - databases
cancerchromosomes
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezCancerChromosomes new client: self )

		
