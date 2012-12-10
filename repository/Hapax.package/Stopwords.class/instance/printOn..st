printing
printOn: aStream

	self asSortedCollection 
		do: [ :each | aStream nextPutAll: each ]
		separatedBy: [ aStream space ]