accessing
resultsFileOff
	" Allow to download megablast results as a gzip-compressed file "
	
	self clientUrl addParameters: 'RESULTS_FILE=no'