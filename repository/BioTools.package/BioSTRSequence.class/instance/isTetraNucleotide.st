testing
isTetraNucleotide
	" Answer <true> if receiver is  a tetra-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 4 ]