samples-microsat
microsat01Sample02
	" microsat.arp "
	
	matrix := self initMatrixRows: 3 columns: 2.
	matrix 
		atColumn: 1 put: #(123 125 130);
		atColumn: 2 put: #(134 140 128).	

	^ BioA31SampleCollection forDNA
			identifiers: #(2 17 6);
			frequencies: #(37 1 21);
			matrix: matrix