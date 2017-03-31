testing
isRunningInWindows
	" Answer <true> if the host system is running in Microsoft Windows "
	
	^ Smalltalk os isWin32 or: [ Smalltalk os isWindows ]