*biopharo
requestXmlFile

	^ UIManager default chooseFullFileNameMatching: (Array with: self filenameMatchPattern , BioXMLFormatter formatExtension)