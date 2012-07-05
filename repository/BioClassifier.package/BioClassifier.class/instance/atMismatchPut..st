accessing
atMismatchPut: anObject
	" Take an action when the receiver's subect cannot be classified "
	
	( self mismatches at: #mismatches ) 
		add: anObject;
		yourself
