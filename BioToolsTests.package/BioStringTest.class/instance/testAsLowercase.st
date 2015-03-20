testing
testAsLowercase

	self assert: (#('HOLA') asLowercase bioHasEqualElements: #('hola')).
	self assert: (#('FIRST' 'Second' 'third') asLowercase bioHasEqualElements: #('first' 'second' 'third')).
	self assert: (#(#BORGES 'ALVAREZ') asLowercase bioHasEqualElements:  #('borges' 'alvarez')).

	self should: [ #(1 30 'BORGES') asLowercase ] raise: Exception.

	