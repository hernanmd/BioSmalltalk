*BioTools
asBioFileReference
	" Answer a <FileReference> using the receiver as a file name in one of the BioSmalltalk subdirectories "

	^ ((self asBioDataFileReference union: self asBioTestFileReference) union: self asBioScriptFileReference) anyOne