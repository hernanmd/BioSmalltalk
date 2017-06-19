*BioTools
asBioDataFileReference
	" Answer a <FileReference> using the receiver as a file name in the DATA BioSmalltalk subdirectory "

	^ ((BioObject dataFilesFullDirectoryName allChildrenMatching: self) select: #isFile) anyOne