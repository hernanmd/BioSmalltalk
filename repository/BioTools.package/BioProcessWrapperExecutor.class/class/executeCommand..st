accessing
executeCommand: aCommandName
	" See superimplementor's comment "

	| process output answer |

	process := (self classFor: self providerClass) new.
	output := process 
		useStdout;
		useStderr;
		startWithShellCommand: aCommandName;
		upToEnd.
	^ (answer := process errorUpToEnd) isEmpty not "process exitCode = 0"
			ifTrue: [ answer ]
			ifFalse: [ output ]