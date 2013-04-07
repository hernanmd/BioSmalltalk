*biopharo14
fileExists: fileName
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ self fileDirectoryClass 
			default
			fileExists: fileName