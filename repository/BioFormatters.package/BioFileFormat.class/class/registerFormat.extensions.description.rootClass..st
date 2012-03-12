accessing
registerFormat: nameString extensions: aCollection description: descriptionString rootClass: aClass
	" Answer a new instance of the receiver "
	
	self registry add:
		( self new 
			extensions: aCollection;
			description: descriptionString;
			name: nameString;
			rootClass: aClass ).

			