accessing public - databases
chromosome
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBIChromosome new client: self )