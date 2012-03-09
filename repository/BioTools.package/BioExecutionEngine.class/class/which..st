accessing
which: programName
	" Answer a String with the fully qualified path for programName, i.e. if programName is 'blast.exe' then in Windows family the answer will be 'blast.exe' "
	
	^ self adapterClass which: programName