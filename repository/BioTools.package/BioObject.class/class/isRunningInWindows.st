testing
isRunningInWindows
	" Answer <true> if the host system is running in Microsoft Windows "
	
	^ OSPlatform isWin32 or: [ OSPlatform isWin32CE ]