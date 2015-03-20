accessing public - databases
gss
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIGSS new client: self)