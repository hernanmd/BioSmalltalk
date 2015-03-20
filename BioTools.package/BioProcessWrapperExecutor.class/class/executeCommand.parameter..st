accessing
executeCommand: aCommandName parameter: parameterName
	" See superimplementor's comment "

	| process |

	process := (self classFor: self providerClass) new.
	^ process 
		useStdout;
		startWithShellCommand: aCommandName , String space , parameterName;
		upToEnd.