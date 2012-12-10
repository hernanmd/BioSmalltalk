test
testDifference
	"comment stating purpose of message"

	self assert: (v - 2) = (self vectorClass withAll: #( -1 0 1 2 3 4 5 6 7 8 )).
	self assert: (2 - v) = (self vectorClass withAll: #( 1 0 -1 -2 -3 -4 -5 -6 -7 -8 )).
	self assert: (v - 2) = (2 - v) negated.

	v -= 2.
	self assert: v = (self vectorClass withAll: #( -1 0 1 2 3 4 5 6 7 8 )).