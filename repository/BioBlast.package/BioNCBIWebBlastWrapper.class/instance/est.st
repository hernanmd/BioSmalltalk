accessing public - databases
est
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: ( BioNCBIEST new client: self )