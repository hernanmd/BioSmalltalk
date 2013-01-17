constants
tempFolder

	^OSPlatform isWin32
		ifTrue: [ ProcessWrapper new
			        useStdout;
				        startWithShellCommand: 'echo %TMP%';
				        upToEnd. ]
		ifFalse: [ '/tmp' ]