test
testAccessors4
	"comment stating purpose of message"

	v := self vectorClass withAll: #(4 5 7).
	v at: 1 put: 0.
	v at: 2 put: 0.
	v at: 3 put: 0.

	self assert: (v at: 1) = 0.
	self assert: (v at: 2) = 0.
	self assert: (v at: 3) = 0.