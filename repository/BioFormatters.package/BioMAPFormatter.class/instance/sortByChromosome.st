accessing
sortByChromosome
	" Sort records by chromosome number. Answer a new instance of the receiver. This is similar to evaluating the shell command :
	$ sort -t$'\t' -k 1,1n ""$inputFile"" > ""$inputFile.out"

	^ self sortByField: 1.