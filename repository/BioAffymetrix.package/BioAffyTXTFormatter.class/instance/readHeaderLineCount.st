accessing-header
readHeaderLineCount
	" Read and skip the first headerLineCount of the receiver's input file "

	^ self header: (self prvReadHeaderLineCount: self headerLineCount)
