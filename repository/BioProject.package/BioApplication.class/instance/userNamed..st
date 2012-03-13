accessing
userNamed: aNameString
	" Add a GTUser to the receiver's collection "

	^ self users 
		at: aNameString
		ifAbsent: [ self signalNotFound: aNameString ] 			