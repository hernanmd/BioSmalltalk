examples
example2
	<example>
	
	^ self new
		chipSize: 50000;	
		inputFile: 'Placas1-2_ArBos1_comunes_2.txt';
		fileNamePrefix: 'ArBos1_';		
		headerLineCount: 6;
		readHeaderLineCount;		
		buildPositionSubset;
		yourself.
