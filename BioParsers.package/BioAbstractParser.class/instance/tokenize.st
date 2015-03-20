accessing
tokenize
	" Private - Tokenize the receiver's expression if necessary "
	
	^ (results isNil or: [ results isEmpty ])
		ifTrue: [ self tokenize: expression ]
		ifFalse: [ self error: 'Results not empty' ]