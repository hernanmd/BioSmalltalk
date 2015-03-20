accessing
which: programName
	" Answer a <String> with the full qualified path to programName if can be located by the which command "

	" ToDo: Check which behavior with more than which installed "

	^ (self executeCommand: 'which' parameter: programName) trimRight