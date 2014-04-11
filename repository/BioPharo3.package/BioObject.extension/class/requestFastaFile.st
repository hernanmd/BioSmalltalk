*BioPharo3
requestFastaFile
	" Open request dialog to select a FASTA file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension)
		label: 'Choose FASTA file'