*BioTools
asBioTestFileReference
	" Answer a <FileReference> using the receiver as a file name in the TESTS BioSmalltalk subdirectory "

	^ ((BioObject testFilesFullDirectoryName allChildrenMatching: self) select: #isFile) anyOne