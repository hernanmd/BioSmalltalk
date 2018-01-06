properties
buildPath: fileName

	^ String streamContents: [ : stream |
		stream
			nextPutAll: self cwd;
			nextPutAll: fileName ]