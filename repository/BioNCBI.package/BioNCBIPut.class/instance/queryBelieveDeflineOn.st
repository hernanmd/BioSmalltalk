accessing
queryBelieveDeflineOn
	" Whether to believe defline in FASTA query "
	
	self clientUrl queryAt: 'QUERY_BELIEVE_DEFLINE' put: 'yes'