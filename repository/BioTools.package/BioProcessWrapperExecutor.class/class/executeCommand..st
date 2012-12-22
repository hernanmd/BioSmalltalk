accessing
executeCommand: aCommandName
	" See superimplementor's comment "

	| process output answer |

	process := ( self classFor: self providerClass ) new.
	output := process 
		useStdout;
		useStderr;
		startWithShellCommand: aCommandName;
		upToEnd.
	^ "process exitCode = 0"
		(answer := process errorUpToEnd) isEmpty not
			ifTrue: [ answer ]
			ifFalse: [ output ]