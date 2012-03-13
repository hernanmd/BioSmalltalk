samples-microsat
microsat01Sample01
	" microsat.arp "
	
	matrix := self initMatrixRows: 2 columns: 2.
	matrix 
		atColumn: 1 put: #(123 125);
		atColumn: 2 put: #(134 132).	

	^ BioA31SampleCollection forDNA
			identifiers: #(1 40);
			frequencies: #(27 1);
			matrix: matrix