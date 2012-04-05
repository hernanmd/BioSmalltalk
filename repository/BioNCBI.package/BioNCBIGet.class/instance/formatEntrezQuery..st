accessing
formatEntrezQuery: aString
	" Entrez query to limit formatting of Blast results "
	
	self clientUrl addParameters: 'FORMAT_ENTREZ_QUERY=' , aString