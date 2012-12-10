test
testSum
	"comment stating purpose of message"

	self assert: (v + 2) = (self vectorClass withAll: #( 3 4 5 6 7 8 9 10 11 12 )).
	self assert: (v + 2) = (2 + v).

	v += 2.
	self assert: v = (self vectorClass withAll: #( 3 4 5 6 7 8 9 10 11 12 )).