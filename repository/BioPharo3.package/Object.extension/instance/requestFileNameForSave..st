*BioPharo3
requestFileNameForSave: extensionString
	" Private - Request file name to the user "
	
	| answer |
	
	^ (answer := UIManager default
		request: 'Save as...(.' , extensionString , ' extension will be appened)' translated 
		initialAnswer: nil
		title: 'Save Dialog' translated) isNil
			ifTrue:[ answer ]
			ifFalse: [ answer , '.' , extensionString ]
