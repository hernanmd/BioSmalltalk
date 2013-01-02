*biopharo
requestCsvFile

	^ UIManager default chooseFullFileNameMatching:  (Array with: self filenameMatchPattern , BioCSVFormatter formatExtension)