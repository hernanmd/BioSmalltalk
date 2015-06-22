*BioPharo4
requestOpenCSVFile
	" Open request dialog to select a CSV file "
	
	^ UIManager default 
		chooseFullFileNameMatching:  (Array with: self filenameMatchPattern , BioCSVFormatter formatExtension)
		label: 'Choose CSV file'