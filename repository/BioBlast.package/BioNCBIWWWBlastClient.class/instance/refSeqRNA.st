accessing public - databases
refSeqRNA
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIRefSeqRNA new client: self )