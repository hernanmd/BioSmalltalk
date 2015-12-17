accessing
sortByChromosome
	" Sort records by chromosome number. Answer a new instance of the receiver. This is similar to evaluating the shell command :
	$ sort -t$'\t' -k 1,1n ""$inputFile"" > ""$inputFile.out"

	| mapArray sortedMap |
	mapArray := self buildMapArray.
	sortedMap := mapArray asSortedCollection: [ : fieldA : fieldB | (fieldA at: 1) < (fieldB at: 1) ].
	^ sortedMap