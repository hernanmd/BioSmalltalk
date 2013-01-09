*BioSqueak
requestXmlFile
	" Convenience method for selecting a XML file "
	
	^ UIManager default 
			chooseFileMatching: (Array with: self filenameMatchPattern , BioXMLFormatter formatExtension) 
			label: 'Please select a XML file' translated