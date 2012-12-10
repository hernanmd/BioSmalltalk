test
testAccessors2
	"comment stating purpose of message"

	v := self vectorClass new: 3.
	v at: 1 put: 77.
	v at: 2 put: 23.
	v at: 3 put: 42.

	self assert: (v at: 1) = 77.
	self assert: (v at: 2) = 23.
	self assert: (v at: 3) = 42.