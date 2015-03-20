accessing
entrezLinksNewWindowOn
	" Add TARGET to Entrez links in formatted results "
	
	self clientUrl queryAt: 'ENTREZ_LINKS_NEW_WINDOW' put: 'yes'