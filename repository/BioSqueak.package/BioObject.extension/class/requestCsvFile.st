*BioSqueak
requestCsvFile
	" Convenience method for selecting a CSV file "
	
	^ UIManager default 
			chooseFileMatching: (Array with: self filenameMatchPattern , BioCSVFormatter formatExtension) 
			label: 'Please select a CSV file' translated