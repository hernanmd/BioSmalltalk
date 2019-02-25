examples
example2
	<example>
	
	^ self new
		inputFile: 'Placas1-2_ArBos1_comunes_2.txt';
		headerLineCount: 6;
		buildPositionSubset;
		yourself.
