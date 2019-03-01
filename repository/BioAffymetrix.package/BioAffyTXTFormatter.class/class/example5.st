examples
example5
	" Compare two CSV files with format: probeset_id\tchr\tstart and write sorted report "
	<example>
	
	^ self new
		fileNamePrefix: 'Bos1_';	
		chipSize: 50000;
		headerLineCount: 1;
		inputFile: 'AAS-Bos1.filtered.txt';
		columns: 377;
		sortReport;
		yourself