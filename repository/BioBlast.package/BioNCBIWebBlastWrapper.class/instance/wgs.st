accessing public - databases
wgs
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIWGS new client: self )