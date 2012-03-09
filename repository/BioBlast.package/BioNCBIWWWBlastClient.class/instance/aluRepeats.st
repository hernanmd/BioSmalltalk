accessing public - databases
aluRepeats
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIALURepeats new client: self )