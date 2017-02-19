accessing
isRunningInWindows
	" Answer <true> if the host system is running in Microsoft Windows "
	
	^ self provider os isWin32 or: [ self provider os isWindows ]