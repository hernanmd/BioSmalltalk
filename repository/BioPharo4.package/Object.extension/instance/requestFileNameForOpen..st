*BioPharo4
requestFileNameForOpen: extensionString
	" Open request dialog to select a file "
	
	^ UIManager default 
		chooseFullFileNameMatching: (Array with: '*.' , extensionString)
		label: 'Choose ' , extensionString , ' file'