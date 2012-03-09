accessing public - databases
estOthers
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIESTOthers new client: self )