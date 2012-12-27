accessing
executeCommand: aCommandName parameter: parameterName
	" Execute aCommandName with parameterName, Answer an empty String if aCommandName is not found , otherwhise answer the aCommandName output "

	| process paths |

	process := ( self classFor: self providerClass ) new.
	^ process 
		useStdout;
		startWithShellCommand: aCommandName , String space , parameterName;
		upToEnd.