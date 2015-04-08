testing
testFilesFullDirectoryName
	" Answer a <String> of the full path directory name where the files for testing are located "

	^ self workingDirectory asFileReference / self testFilesDirectoryName