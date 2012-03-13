accessing
addApplicationUser: aBioUser
	" Private - Add a aBioUser to the receiver's collection "

	( self applicationUsers includesKey: aBioUser name )
		ifTrue: [ self signalDuplicateObject: 'User already present ' , aBioUser name ].
	self applicationUsers add: aBioUser name -> aBioUser