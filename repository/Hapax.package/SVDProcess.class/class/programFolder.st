constants
programFolder

	^OSPlatform isWin32
		ifTrue: [ ProcessWrapper new
			        useStdout;
				        startWithShellCommand: 'echo %CommonProgramFiles%';
				        upToEnd. ]
		ifFalse: [ ((Smalltalk at: #OSProcess) environment at: 'HOME'), '/Library' ]