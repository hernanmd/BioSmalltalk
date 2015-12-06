accessing
which: programName
	" Answer a <String> with the full qualified path to programName if can be located by the which command "

	" ToDo: Check which behavior with more than which.exe installed "
	" ToDo: Compare with Locate32 "
	| rs |
	((rs := self executeCommand: 'which' parameter: programName) isEmpty and: [ (rs := self executeCommand: 'where' parameter: programName) isEmpty ])
		ifTrue: [ ^ self signalNotFound: programName , ' in PATH' ].
	^ rs trimRight
