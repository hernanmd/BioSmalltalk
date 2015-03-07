accessing public - databases
estOthers
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIESTOthers new client: self)