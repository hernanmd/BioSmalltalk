accessing
serverRootDirectory
	" Answer a <String> specifying the directory where web server files are located "

	^ self fileDirectoryClass default fullName , self testFilesDirectoryName