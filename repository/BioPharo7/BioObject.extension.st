Extension { #name : 'BioObject' }

{ #category : '*BioPharo7' }
BioObject class >> requestDirectoryPath [
	" Answer a <FileReference> with selected directory "

	| reference |
	StOpenDirectoryPresenter new
		openFolder: FileLocator workingDirectory;
		title: 'Choose directory';
		okAction: [ :directoryReference | reference := directoryReference ];
		openModal.
	^ reference

]

{ #category : '*BioPharo7' }
BioObject class >> requestOpenCSVFile [
	" Open request dialog to select a CSV file "
	
	^ UIManager default 
		chooseFullFileNameMatching:  (Array with: BioCSVFormatter formatExtension)
		label: 'Choose CSV file'
]

{ #category : '*BioPharo7' }
BioObject class >> requestOpenFASTAFile [
	" Open request dialog to select a FASTA file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: BioFASTAFormatter formatExtension)
		label: 'Choose FASTA file'
]

{ #category : '*BioPharo7' }
BioObject class >> requestOpenXMLFile [
	" Open request dialog to select a XML file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: BioXMLFormatter formatExtension)
		label: 'Choose XML file'
]
