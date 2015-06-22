filesystem
openOrCreateFileNamed: fileName
	" Answer a <FileStream> for fileName in the image directory. "
	
	^ self class openOrCreateFileNamed: fileName
	