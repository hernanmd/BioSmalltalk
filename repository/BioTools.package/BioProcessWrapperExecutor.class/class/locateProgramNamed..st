accessing
locateProgramNamed: programName

	| cmdResult |
			
	(cmdResult := self locateProgramStandard: programName) isEmpty
		ifTrue: [ ^ self signalNotFound: programName , ' in PATH' ].
	^ cmdResult trimRight
