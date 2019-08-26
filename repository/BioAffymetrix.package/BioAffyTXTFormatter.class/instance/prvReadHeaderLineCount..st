accessing-header
prvReadHeaderLineCount: value
	" Answer a <String> containing the first line of the receiver's input file "

	^ self inputFile asFileReference readStreamDo: [ : readStream |
		(NeoCSVReader on: readStream)
			separator: self delimiter;
			skipHeader: value - 1;
			readHeader ].
