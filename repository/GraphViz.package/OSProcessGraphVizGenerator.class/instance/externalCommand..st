generating
externalCommand: commandString
	"Use OSProcess to evaluate an external command in a PipeableOSProcess.
	Answer the PipeableOSProcess. The sender can obtain output streams and
	exit status from the completed PipeableOSProcess as required."

	^ (Smalltalk
		at: #PipeableOSProcess
		ifAbsent: [self notify: 'OSProcess and CommandShell packages not loaded in this image'])
			command: commandString