*biopharo14
fullFileNameFor: fileName
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ self fileDirectoryClass default
			fullNameFor: 
				self workingDirectory , 
				self fileDirectoryClass slash , 
				fileName.
	