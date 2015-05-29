*BioPharo3
requestOpenXMLFile
	" Open request dialog to select a XML file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioXMLFormatter formatExtension)
		label: 'Choose XML file'