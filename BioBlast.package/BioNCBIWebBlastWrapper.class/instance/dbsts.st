accessing public - databases
dbsts
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: ( BioNCBIDBSTS new client: self )