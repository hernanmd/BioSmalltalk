examples
example3
	" Compare two CSV files with format: probeset_id\tchr\tstart"
	<example>
	
	^ self new
		chipSize: 50000;
		commProbesFrom: 'affy_3727850132.txt' to: 'affy_3727849777.txt';
		yourself.
