testing
testIsNumeric

	self assert: '123' isNumeric.
	self assert: '123.45' isNumeric.
	self assert: '.45' isNumeric.
	self assert: '+123.45' isNumeric.
	self assert: '-123.45' isNumeric.
	self deny: '12.3.45' isNumeric.
	self assert: '123.45e100' isNumeric.
	self assert: '123.45e-100' isNumeric.
	self assert: '5.23e-6' isNumeric.
	self deny: '5.23e-6e' isNumeric.