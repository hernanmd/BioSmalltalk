populating
fillMatrix
	" Private - Matrix with nucleotide data in HaploView file format begins from the 7th column "
	
	| index |
	
	self bioLog: 'Filling matrix...'.
	
	index := 0.
	self parser rowsDo: [: rs |
		matrix 
			at: ( index \\ samplesSize + 1 )
			at: ( index // samplesSize + 7 )
			put: ( self valueFor: rs ).
		index := index + 1 ].
	
	self bioLog: 'Finished filling matrix'
