accessing public - databases
wgs
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIWGS new client: self)