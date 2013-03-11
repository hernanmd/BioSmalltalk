accessing
atMatchesPut: anObject
	" Take an action when the receiver's subect is classified "
	
	self matches
		add: anObject;
		yourself
