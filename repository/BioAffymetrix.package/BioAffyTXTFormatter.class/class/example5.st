examples
example5
	" Compare two CSV files with format: probeset_id\tchr\tstart"
	<example>
	
	^ self new
		chipSize: 50000;
		headerLineCount: 1;
		inputFile: 'ComunesBos1.csv';
		columns: 377;
		sortReport;
		yourself