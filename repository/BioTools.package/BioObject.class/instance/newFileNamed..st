convenience-filesystem
newFileNamed: fileName
	" Answer a <FileStream> for a new fileName in the receiver's configured folder "
	
	^ self class newFileNamed: fileName