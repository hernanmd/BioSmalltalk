accessing public - databases
refSeqRNA
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIRefSeqRNA new client: self)