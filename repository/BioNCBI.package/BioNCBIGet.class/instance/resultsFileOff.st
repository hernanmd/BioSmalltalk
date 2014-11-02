accessing
resultsFileOff
	" Allow to download megablast results as a gzip-compressed file "
	
	self clientUrl queryAt: 'RESULTS_FILE' put: 'no'