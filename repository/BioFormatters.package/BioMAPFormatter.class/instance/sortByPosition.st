accessing
sortByPosition
	" Sort records by chromosome position. Answer a new instance of the receiver. This is similar to evaluating the shell command :
	
	$ sort -t$'\t' -k 4,4n ""$inputFile"" > ""$inputFile.out"
	
	^ self