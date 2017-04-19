testing
isMonoNucleotide
	" Answer <true> if receiver is all the same letter "

	^ self notEmpty and: [ self repeats = 1 ]