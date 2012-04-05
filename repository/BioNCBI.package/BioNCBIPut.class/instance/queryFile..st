accessing
queryFile: aString
	" Sequence query (queries if MegaBlast page).
	aString is Accession(s), gi(s), or FASTA sequence(s) "
	
	self clientUrl addParameters: 'QUERY_FILE=' , aString