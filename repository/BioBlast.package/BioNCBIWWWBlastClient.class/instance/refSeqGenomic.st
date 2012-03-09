accessing public - databases
refSeqGenomic
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIRefSeqGenomic new client: self )