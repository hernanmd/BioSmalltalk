accessing public - databases
pubmed
	" Set and answer the receiver's working database "
		
	^ self database: (BioEntrezPubMed new client: self)

		
