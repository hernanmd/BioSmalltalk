convenience-filesystem
newFullFileNamed: fileName
	" Answer a <FileStream> for a new fileName in the receiver's configured folder "
	
	^ self class newFullFileNamed: fileName