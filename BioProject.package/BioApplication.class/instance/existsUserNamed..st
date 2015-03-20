testing
existsUserNamed: nameString
	" Answer <true> if nameString exists as user in the receiver "

	^ self applicationUsers includesKey: nameString