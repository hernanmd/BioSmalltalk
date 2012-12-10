test
testSumVector
	"comment stating purpose of message"

	self assert: (v + w) = (self vectorClass withAll: #( -4 -3 -2 -1 0 1 2 3 4 5 )).
	self assert: (v + w) = (w + v).