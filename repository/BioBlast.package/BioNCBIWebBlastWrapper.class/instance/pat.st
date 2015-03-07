accessing public - databases
pat
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIPat new client: self)