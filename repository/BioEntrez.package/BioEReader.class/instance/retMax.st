accessing
retMax
	" Answer a String with number of record retrieved
	See http://www.ncbi.nlm.nih.gov/corehtml/query/static/esummary_help.html#DisplayNumbers for details "
	
	^ self accessNode: 'RetMax'