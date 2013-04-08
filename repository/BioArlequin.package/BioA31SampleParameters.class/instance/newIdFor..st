private
newIdFor: prefix

	prvIdentifiers 
		at: prefix
		ifPresent: [ : elem | prvIdentifiers at: prefix put: elem + 1 ]
		ifAbsent: [ prvIdentifiers at: prefix put: 1 ].
	^ prefix , (prvIdentifiers at: prefix) greaseString
