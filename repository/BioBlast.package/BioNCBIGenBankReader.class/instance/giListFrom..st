accessing-entrez
giListFrom: anObject
	" Answer a Collection with the gene identifiers numbers from anObject "

	^ anObject contents 
		collect: [: id | BioParser tokenizeGi: id hitIdentifier blastValue ]