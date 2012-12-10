test
testAccessors
	"comment stating purpose of message"

	v := self vectorClass new: 1.
	v at: 1 put: 77.

	self assert: (v at: 1) ~= 0.
	self assert: (v at: 1) ~= nil.