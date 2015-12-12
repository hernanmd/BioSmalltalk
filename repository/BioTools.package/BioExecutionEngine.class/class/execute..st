accessing
execute: programName
	" Execute programName and answer a resulting <String> "
	
	^ self adapterClass executeCommand: programName