accessing
locateProgram: programName
	" Answer a <String> with the full qualified path to programName if can be located by the which command "
	
	^ self adapterClass locateProgram: programName