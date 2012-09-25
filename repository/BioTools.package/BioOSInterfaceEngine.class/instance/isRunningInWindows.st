accessing
isRunningInWindows
	" Answer <true> if the host system is running in Microsoft Windows "
	
	^ self provider isWin32 or: [ self provider isWin32CE ]