*BioTools
asBioScriptFileReference
	" Answer a <FileReference> using the receiver as a file name in the SCRIPTS BioSmalltalk subdirectory "

	^ ((BioObject scriptsFullDirectoryName allChildrenMatching: self) select: #isFile) anyOne