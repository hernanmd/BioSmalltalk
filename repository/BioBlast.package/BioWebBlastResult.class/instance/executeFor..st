initialize-release
executeFor: aClient
	" Private - Perform the actual search using aClient parameters "
	
	^ self reader results
		ifNil: [ self executeFirstRequest: aClient ]
		ifNotNil: [ self executeQuery: aClient ].

	