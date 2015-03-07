accessing public - databases
chromosome
	" Set the receiver's working database.
	Answer a <BioCommandObject> for specifying operations "
		
	^ self database: (BioNCBIChromosome new client: self)