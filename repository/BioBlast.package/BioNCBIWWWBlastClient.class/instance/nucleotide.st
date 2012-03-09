accessing public - databases
nucleotide
	" Set the receiver's working database.
	Answer the GTCommandObject for specifying operations "
		
	^ self database: ( BioNCBINucleotideCollection new client: self )