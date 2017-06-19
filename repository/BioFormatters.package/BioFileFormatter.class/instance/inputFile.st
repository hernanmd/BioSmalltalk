accessing
inputFile
	" Answer a <String> with the file name of the input file. If cwd is set, then prepend its value to inputFile, otherwise just answer input file value  "

	^ String streamContents: [ : aStream |
			aStream 
				nextPutAll: self cwd;
				nextPutAll: self platformSeparator;
				nextPutAll: inputFile ]

