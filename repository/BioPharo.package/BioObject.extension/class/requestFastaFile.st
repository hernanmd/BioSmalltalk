*biopharo
requestFastaFile

	^ UIManager default chooseFullFileNameMatching: 
		(Array with: self filenameMatchPattern , BioFASTAFormatter formatExtension)