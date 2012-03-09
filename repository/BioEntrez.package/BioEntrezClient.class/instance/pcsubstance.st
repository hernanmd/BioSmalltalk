accessing public - databases
pcsubstance
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPCSubstance new client: self )

		
