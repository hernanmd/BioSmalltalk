accessing public - databases
peptidome
	" Set and answer the receiver's working database "
		
	^ self database: ( BioEntrezPeptidome new client: self )

		
