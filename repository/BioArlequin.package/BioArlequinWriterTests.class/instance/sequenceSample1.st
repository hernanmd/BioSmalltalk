samples-dna
sequenceSample1

	matrix := self initMatrixRows: 2 columns: 2.
	matrix 
		atColumn: 1 put: #(A G A A G G T T);
		atColumn: 2 put: #(T C G A G A C C).
		
	^ BioA31SampleCollection forDNA
			identifiers: #(1 3 5 7);
			frequencies: #(4 5 3 8);
			matrix: matrix