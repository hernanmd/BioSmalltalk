examples
example4
	" Compare two CSV files with format: probeset_id\tchr\tstart"
	<example>
	
	^ self new
		chipSize: 50000;
		headerLineCount: 1;		
		inputFile: 'ComunesArBos1.csv';
		columns: 754;
		sortReport;
		yourself