test
testProduct
	"comment stating purpose of message"

	self assert: (v * 2) = (self vectorClass withAll: #( 2 4 6 8 10 12 14 16 18 20 )).
	self assert: (v * 2) = (2 * v).

	v *= 2.
	self assert: v = (self vectorClass withAll: #( 2 4 6 8 10 12 14 16 18 20 )).