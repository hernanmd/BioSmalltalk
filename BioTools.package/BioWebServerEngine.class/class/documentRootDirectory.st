accessing
documentRootDirectory
	" Answer a <String> specifying the directory where web server files will be located "

	^ self fileDirectoryClass default fullName , self testFilesDirectoryName