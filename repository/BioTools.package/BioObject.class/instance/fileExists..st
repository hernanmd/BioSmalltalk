filesystem
fileExists: fileName
	" Answer <true> if fileName exists in receiver's working directory "
	
	^ self class fileExists: fileName