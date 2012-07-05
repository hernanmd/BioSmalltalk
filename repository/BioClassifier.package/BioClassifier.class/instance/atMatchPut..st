accessing
atMatchPut: anObject
	" Take an action when the receiver's subect cannot be classified "
	
	( self matches at: #matches ) 
		add: anObject;
		yourself
