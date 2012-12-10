test
testQuotient
	"comment stating purpose of message"

	self assert: (v / 2) = (self vectorClass withAll: #( 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 )).
	self assert: (2 / v) first = 2.
	self assert: (v / 2) = (2 / v) reciprocal.

	v /= 2.
	self assert: v = (self vectorClass withAll: #( 0.5 1 1.5 2 2.5 3 3.5 4 4.5 5 )).