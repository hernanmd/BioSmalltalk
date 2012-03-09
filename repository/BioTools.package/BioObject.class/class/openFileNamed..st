filesystem
openFileNamed: fileName
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ self fileStreamClass 
			readOnlyFileNamed: 
				self workingDirectory , 
				self fileDirectoryClass slash , 
				fileName.
	