*BioPharo3
requestOpenFASTAFile
	" Open request dialog to select a FASTA file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension)
		label: 'Choose FASTA file'