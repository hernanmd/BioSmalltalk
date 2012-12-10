test
testDotProduct
	"comment stating purpose of message"

	v := self vectorClass withAll: #( 1 2 3 ).
	w := self vectorClass withAll: #( 5 -11 7 ).

	self assert: (v dotProduct: w) = ((1*5) + (2* (-11)) + (3*7)).
	self assert: (v dotProduct: v) = ((1*1) + (2*2) + (3*3)).
	self assert: (w dotProduct: w) = ((5*5) + (11*11) + (7*7)).