testing
isDiNucleotide
	" Answer <true> if receiver is   a di-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 2 ]