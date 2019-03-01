examples
example1 
	<example>
	
	^ self new
		chipSize: 50000;	
		inputFile: 'AAS-Bos1.txt';
		fileNamePrefix: 'Bos1_';
		headerLineCount: 6;
		readHeaderLineCount;
		buildPositionSubset;
		yourself.
