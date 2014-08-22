accessing
createUserNamed: nameString
	" Create a new user named nameString in the receiver users "

	^ self applicationUsers 
		at: nameString
		put: (BioUser named: nameString)