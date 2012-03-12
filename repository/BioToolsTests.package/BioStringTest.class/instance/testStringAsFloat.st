testing
testStringAsFloat

	self assert: '123' asFloat isFloat.
	self assert: '123.45' asFloat isFloat.
	self assert: '-123.45' asFloat isFloat.
	self assert: '12.3.45' asFloat isFloat.
	self assert: '123.45e100' asFloat isFloat.
	self assert: '123.45e-100' asFloat isFloat.
	self assert: '5.23e-6' asFloat isFloat.
	self assert: '5.23e-6e' asFloat isFloat.