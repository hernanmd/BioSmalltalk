accessing
formatEntrezQuery: aString
	" Entrez query to limit formatting of Blast results "
	
	self clientUrl queryAt: 'FORMAT_ENTREZ_QUERY' put: aString