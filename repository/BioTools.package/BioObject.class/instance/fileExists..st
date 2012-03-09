filesystem
fileExists: fileName
	" Answer <true> if fileName exists in receiver's workingDirectory "
	
	^ self class fileExists: fileName
	