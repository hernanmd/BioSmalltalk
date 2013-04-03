filesystem
newFileNamed: fileName
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ (self fileStreamClass 
			newFileNamed: 
				self workingDirectory , 
				self fileDirectoryClass slash , 
				fileName) 
					wantsLineEndConversion: true;
					yourself.
	