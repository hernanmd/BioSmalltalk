accessing
createUserNamed: aNameString
	" Add a GTUser to the receiver's collection "

	^ self applicationUsers 
			at: aNameString
			put: ( BioUser named: aNameString )