Extension { #name : #BioObject }

{ #category : #'*BioPharo7' }
BioObject class >> requestDirectoryPath [
	" Answer a <FileReference> with selected directory "

	| tmpFileDialog |
	tmpFileDialog := FileDialogWindow basicNew
		initialize;
		title: 'Select a directory';
		answerDirectory;
		openModal.
	tmpFileDialog isNil ifTrue: [ self error: 'FileDialogWindow is broken' ].
	^ tmpFileDialog answer "pathString"

]

{ #category : #'*BioPharo7' }
BioObject class >> requestOpenCSVFile [
	" Open request dialog to select a CSV file "
	
	^ UIManager default 
		chooseFullFileNameMatching:  (Array with: BioCSVFormatter formatExtension)
		label: 'Choose CSV file'
]

{ #category : #'*BioPharo7' }
BioObject class >> requestOpenFASTAFile [
	" Open request dialog to select a FASTA file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: BioFASTAFormatter formatExtension)
		label: 'Choose FASTA file'
]

{ #category : #'*BioPharo7' }
BioObject class >> requestOpenXMLFile [
	" Open request dialog to select a XML file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: BioXMLFormatter formatExtension)
		label: 'Choose XML file'
]
