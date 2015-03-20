accessing
addApplicationUser: aBioUser
	" Private - Add a aBioUser to the receiver's users if not present "

	(self applicationUsers includesKey: aBioUser name)
		ifTrue: [ self signalDuplicateObject: 'User ' , aBioUser name ].
	self applicationUsers add: aBioUser name -> aBioUser