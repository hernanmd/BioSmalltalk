accessing public - databases
nucleotide
	" Set the receiver's working database. 
	Answer a <BioCommandObject> for specifying operations "
	
	^ self database: (BioNCBINucleotideCollection new client: self)