accessing
initializeParser: aPathString
	" Private - Set the receiver's parser for new generated code "
	
	self parser: (STextParser on: (BioObject openFullFileNamed: aPathString)).
	self parser 
		delimiter: $;;
		ignoreHeaderLine;
		reset.
	