convenience-filesystem
newFileNamed: fileName
	" Answer a <FileStream> for a new fileName in the receiver's configured folder.
	fileName MUST NOT be an absolute path. If you have absolute path use #newFullFileNamed: "
	
	^ (self fileStreamClass newFileNamed: self workingDirectory , self slash , fileName) 
		yourself.