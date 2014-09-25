accessing
atMatchesPut: anObject
	" Add anObject to the receiver's matched elements "
	
	self matches
		add: anObject;
		yourself
