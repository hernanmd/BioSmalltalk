accessing
initializeParser: aPathString
	" Private - Set the receiver's parser for new generated code "
	
	self parser: (NeoCSVReader on: (BioObject openFullFileNamed: aPathString) readStream).
	self parser 
		separator: $;;
		skipHeader
	