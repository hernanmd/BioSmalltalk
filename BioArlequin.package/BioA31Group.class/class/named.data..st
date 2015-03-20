instance creation
named: aString data: aCollection
	" Answer a new Arlequin group "

	^ self new 
			name: aString;
			data: aCollection;
			yourself