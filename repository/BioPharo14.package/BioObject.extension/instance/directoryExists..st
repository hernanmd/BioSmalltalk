*biopharo14
directoryExists: directoryString
	" Answer <true> if directoryString exists "
	
	^ self fileDirectoryClass 
			default
			directoryExists: directoryString
	