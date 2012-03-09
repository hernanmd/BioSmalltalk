accessing public - databases
envNt
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIEnvNT new client: self )