accessing
atMismatchesPut: anObject
	" Take an action when the receiver's subect cannot be classified "
	
	self mismatches 
		add: anObject;
		yourself
