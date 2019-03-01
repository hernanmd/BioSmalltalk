accessing-header
readHeader
	" Answer a <String> containing the first line of the receiver's input file "

	^ self prvReadHeaderLineCount: 0
			