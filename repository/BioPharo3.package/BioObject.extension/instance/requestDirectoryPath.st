*BioPharo3
requestDirectoryPath
	" Answer a <FileReference> with selected directory "

	| tmpFileDialog |
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: 'Select a directory';
		answerDirectory;
		open.
	^ tmpFileDialog answer "pathString"
