accessing private
cmdLine 
	" Answer a <String> with the full command line for executing the receiver "

	^ String streamContents: [ : stream |
		stream 
			nextPutAll: self programName;
			nextPutAll: self buildCmdLine ]