private
checkCygwinAvailableUnderWindows

	OSPlatform isWin32 ifTrue: [
			| process answer cygpath |
			process := ProcessWrapper new.
			process 
				useStdout;
				useStderr;
				startWithShellCommand: 'cygpath -W' ;
				upToEnd.
			(cygpath := process errorUpToEnd) isEmpty not
				ifTrue: [ 
					(cygpath beginsWith: '/cygdrive') ifFalse: [
					self error: 'The external SVN library requires Cgywin to run under Windows.' ] ]
				ifFalse: [ self error: 'The external SVN library requires Cgywin to run under Windows.'  ]]