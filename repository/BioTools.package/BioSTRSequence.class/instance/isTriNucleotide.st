testing
isTriNucleotide
	" Answer <true> if receiver is  a tri-nucleotide sequence "

	^ self notEmpty and: [ self repeats = 3 ]