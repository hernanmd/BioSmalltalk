accessing public - databases
refSeqGenomic
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIRefSeqGenomic new client: self)