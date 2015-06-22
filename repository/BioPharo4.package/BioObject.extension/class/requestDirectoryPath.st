*BioPharo4
requestDirectoryPath
	" Answer a <FileReference> with selected directory "

	| tmpFileDialog |
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: 'Select a directory';
		answerDirectory;
		openModal.
	tmpFileDialog isNil ifTrue: [ self error: 'FileDialogWindow is broken' ].
	^ tmpFileDialog answer "pathString"
