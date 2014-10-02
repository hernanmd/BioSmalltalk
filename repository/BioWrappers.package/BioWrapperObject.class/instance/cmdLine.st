accessing private
cmdLine 
	" Answer a <String> with the full command line for executing the receiver "

	cmdLine := String streamContents: [ : stream |
		stream 
			nextPutAll: self programName;
			nextPutAll: self buildCmdLine ].
	^ cmdLine