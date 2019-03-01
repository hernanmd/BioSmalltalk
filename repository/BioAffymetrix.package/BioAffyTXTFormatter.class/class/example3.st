examples
example3
	" Compare two CSV files with format: probeset_id\tchr\tstart"
	<example>
	
	^ self new
		chipSize: 50000;
		intersect: 'affy_ArBos1_3728682249.txt' with: 'affy_Bos1_3728682227.txt' prefixes: 'Bos1_' -> 'ArBos1_';
		yourself.
