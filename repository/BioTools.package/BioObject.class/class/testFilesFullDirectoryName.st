testing
testFilesFullDirectoryName
	" Answer a String where the files for testing will be placed "

	^ self workingDirectory , 
                self fileDirectoryClass slash ,
                self testFilesDirectoryName , 
                self fileDirectoryClass slash.
