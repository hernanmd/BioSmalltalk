*BioPharo3
requestFileNameForSave: extensionString
	" Private - Request file name to the user. Answer a <String> with the full path name, or an empty <String> meaning dialog was cancelled "
	
	| filename |
	filename := UITheme builder
		fileSave: 'Save as ' , extensionString
		extensions: (Array with: extensionString)
		path: nil.
	filename ifNil: [ self inform: 'Saving cancelled'. 
		^ '' ].
	^ filename fullName
