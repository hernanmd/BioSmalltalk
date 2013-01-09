*BioSqueak
requestFastaFile
	" Convenience method for selecting a fasta file "
	
	^ UIManager default 
			chooseFileMatching: (Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension) 
			label: 'Please select a fasta file' translated