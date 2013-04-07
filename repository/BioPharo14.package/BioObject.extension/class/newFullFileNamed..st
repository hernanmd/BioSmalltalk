*biopharo14
newFullFileNamed: fileName
	" Answer a FileStream for a new fileName in the receiver's configured folder "
	
	^ (self fileStreamClass 
			newFileNamed: fileName) 
					wantsLineEndConversion: true;
					yourself.
	