examples
example4
	" Compare two CSV files with format: probeset_id\tchr\tstart and write sorted report "
	<example>
	
	^ self new
		fileNamePrefix: 'ArBos1_';
		chipSize: 50000;
		headerLineCount: 1;		
		inputFile: 'AAS-ArBos1.filtered.txt';
		columns: 754;
		sortReport;
		yourself