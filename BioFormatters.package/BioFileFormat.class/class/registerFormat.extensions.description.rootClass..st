accessing
registerFormat: nameString extensions: aCollection description: descriptionString rootClass: aClass
	" Create a new format and register in the receiver if not present "
	
	| newFormat |
	newFormat := self new 
			extensions: aCollection;
			description: descriptionString;
			name: nameString;
			rootClass: aClass.
	(self registry includes: newFormat)
		ifFalse: [ self registry add: newFormat ]

			