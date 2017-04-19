testing
isPentaNucleotide
	" Answer <true> if receiver is a penta-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 5 ]