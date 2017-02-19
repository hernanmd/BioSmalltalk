accessing - private
buildCmdLine
	" Answer a <String> with receiver's full command line "
	
	^ String streamContents: [ : stream |
		self 
			buildProperties: stream;
			buildOptions: stream;
			buildParameters: stream ]