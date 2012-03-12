testing
testEmptyName

	| nullName |
	
	nullName := 'Unnamed ' , namedObject class name.
	self assert: namedObject name = nullName.
	self deny: namedObject hasName.
