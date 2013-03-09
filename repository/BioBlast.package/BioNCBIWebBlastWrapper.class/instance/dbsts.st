accessing public - databases
dbsts
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIDBSTS new client: self )