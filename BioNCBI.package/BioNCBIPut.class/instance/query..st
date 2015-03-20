mandatory-fields
query: aString
	" Sequence query (queries if MegaBlast page).
	aString is Accession(s), gi(s), or FASTA sequence(s) "
	
	self client queryAt: 'QUERY' put: aString trimBoth withoutCRs