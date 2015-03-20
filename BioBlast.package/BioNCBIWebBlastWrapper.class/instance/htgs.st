accessing public - databases
htgs
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIHTGS new client: self)