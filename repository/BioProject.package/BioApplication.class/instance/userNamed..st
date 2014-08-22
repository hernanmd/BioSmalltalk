accessing
userNamed: aNameString
	" Answer a <BioUser> with user name aNameString, raise an exception if not found "

	^ self users 
		at: aNameString
		ifAbsent: [ self signalNotFound: aNameString ] 			