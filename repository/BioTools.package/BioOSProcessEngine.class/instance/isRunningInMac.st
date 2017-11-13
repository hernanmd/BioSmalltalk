testing
isRunningInMac
	" Answer <true> if the host system is running in Mac OS "
	
	^ self provider isNonUnixMac or: [ self provider isUnixMac ]