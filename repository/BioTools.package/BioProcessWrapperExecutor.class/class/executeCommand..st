accessing
executeCommand: aCommandName
	" Execute aCommandName, Answer an empty String if aCommandName is not found , otherwhise answer the aCommandName output "

	| process output |

	process := ( self classFor: self providerClass ) new.
	output := process 
		useStdout;
		useStderr;
		startWithShellCommand: aCommandName;
		upToEnd.
	^ process exitCode = 0
		ifTrue: [ process errorUpToEnd ]
		ifFalse: [ output ]