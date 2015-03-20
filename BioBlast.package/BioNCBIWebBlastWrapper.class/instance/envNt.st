accessing public - databases
envNt
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: ( BioNCBIEnvNT new client: self )