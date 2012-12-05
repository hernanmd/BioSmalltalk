accessing public - databases
pat
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIPat new client: self )