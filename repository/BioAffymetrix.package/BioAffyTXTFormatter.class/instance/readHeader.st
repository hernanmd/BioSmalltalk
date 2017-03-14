private
readHeader
	" Answer a <String> containing the first line of the receiver's input file "

	^ self inputFile asFileReference readStream upToAnyOf: CharacterSet crlf