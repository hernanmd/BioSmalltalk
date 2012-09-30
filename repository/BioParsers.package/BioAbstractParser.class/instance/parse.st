accessing
parse
	" Private - Parse the receiver's expression if necessary. Answer
	the result of parsing the expresion "
	
	(results isNil or: [ results isEmpty ])
		ifTrue: [ self parse: expression ].
	^ results