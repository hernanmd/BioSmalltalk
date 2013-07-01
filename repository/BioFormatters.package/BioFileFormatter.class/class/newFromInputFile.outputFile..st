instance creation
newFromInputFile: inputFile outputFile: outFilename
	" Answer a new instance of the receiver with a BioFile and outFilename <String> "
	^ self new 
		inputFile: inputFile;
		outputFilename: outFilename;
		yourself