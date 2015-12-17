accessing
sortByPosition
	" Sort records by chromosome position. Answer a new instance of the receiver. This is similar to evaluating the shell command :
	$ sort -t$'\t' -k 4,4n ""$inputFile"" > ""$inputFile.out"

	| mapArray sortedMap |
	mapArray := self buildMapArray.
	sortedMap := mapArray asSortedCollection: [ : fieldA : fieldB | (fieldA at: 4) < (fieldB at: 4) ].
	^ sortedMap