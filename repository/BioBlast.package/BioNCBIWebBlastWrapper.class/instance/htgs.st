accessing public - databases
htgs
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIHTGS new client: self )