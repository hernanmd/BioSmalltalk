testing
hasBehaviorNamed: aSelector 
	" Private - For calculated queries, aSelector should be understood by the receiver "
	
	^ self class canUnderstand: aSelector