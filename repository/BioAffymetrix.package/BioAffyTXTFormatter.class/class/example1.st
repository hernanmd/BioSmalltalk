examples
example1 
	<example>
	
	^ self new
		inputFile: 'Filtro_Bos1_comunes_consola_2.txt';
		headerLineCount: 6;		
		buildPositionSubset;
		yourself.
