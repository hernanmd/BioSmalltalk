accessing
codonTables
	" Answer a <Collection> of codon tables "

	^ codonTables
		ifNil: [ 
			self initializeCodonTables.
			codonTables ]