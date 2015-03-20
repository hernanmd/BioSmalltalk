filesystem
openFullFileNamed: fileName
	" Answer a FileStream for fileName in the image directory. Assume the file exists "
	
	^ self class openFullFileNamed: fileName