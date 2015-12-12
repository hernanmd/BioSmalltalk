accessing
locateProgramStandard: programName
	" Try to locate programName in standard PATH.
	
	NBWin32Shell getPathEntries "

	^ self executeCommand: 'where' parameter: programName