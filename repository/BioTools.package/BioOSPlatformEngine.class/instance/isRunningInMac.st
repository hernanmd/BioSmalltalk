accessing
isRunningInMac
	" Answer <true> if the host system is running in Mac OS "
	
	^ self provider os isMacOS or: [ self provider os isMacOSX ]