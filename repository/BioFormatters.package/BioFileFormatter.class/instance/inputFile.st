accessing
inputFile
	" Answer a <String> with the file name of the input file. If cwd is set, then prepend its value to inputFile, otherwise just answer input file value  "

	self cwd = self defaultCwd 
		ifFalse: [ self inputFile: self cwd , self platformSeparator , inputFile ].
	^ inputFile