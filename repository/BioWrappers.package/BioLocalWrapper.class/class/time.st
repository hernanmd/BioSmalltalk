instance creation
time
	" List contents of current image directory "
	
	^ (self new
		programName: 'time /T';
		execResult) withoutCRs
		