filesystem
newDirectory: directoryName
	" Create directoryName in the receiver's workingDirectory "
	
	^ self fileDirectoryClass 
			default
			createDirectory: directoryName
	